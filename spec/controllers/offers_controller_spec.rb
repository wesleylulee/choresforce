require 'spec_helper'

describe OffersController do

  def mock_offer(stubs={})
    @mock_offer ||= mock_model(Offer, stubs)
  end

  describe "GET index" do
    it "assigns all offers as @offers" do
      Offer.stub(:find).with(:all).and_return([mock_offer])
      get :index
      assigns[:offers].should == [mock_offer]
    end
  end

  describe "GET show" do
    it "assigns the requested offer as @offer" do
      Offer.stub(:find).with("37").and_return(mock_offer)
      get :show, :id => "37"
      assigns[:offer].should equal(mock_offer)
    end
  end

  describe "GET new" do
    it "assigns a new offer as @offer" do
      Offer.stub(:new).and_return(mock_offer)
      get :new
      assigns[:offer].should equal(mock_offer)
    end
  end

  describe "GET edit" do
    it "assigns the requested offer as @offer" do
      Offer.stub(:find).with("37").and_return(mock_offer)
      get :edit, :id => "37"
      assigns[:offer].should equal(mock_offer)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created offer as @offer" do
        Offer.stub(:new).with({'these' => 'params'}).and_return(mock_offer(:save => true))
        post :create, :offer => {:these => 'params'}
        assigns[:offer].should equal(mock_offer)
      end

      it "redirects to the created offer" do
        Offer.stub(:new).and_return(mock_offer(:save => true))
        post :create, :offer => {}
        response.should redirect_to(offer_url(mock_offer))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved offer as @offer" do
        Offer.stub(:new).with({'these' => 'params'}).and_return(mock_offer(:save => false))
        post :create, :offer => {:these => 'params'}
        assigns[:offer].should equal(mock_offer)
      end

      it "re-renders the 'new' template" do
        Offer.stub(:new).and_return(mock_offer(:save => false))
        post :create, :offer => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested offer" do
        Offer.should_receive(:find).with("37").and_return(mock_offer)
        mock_offer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :offer => {:these => 'params'}
      end

      it "assigns the requested offer as @offer" do
        Offer.stub(:find).and_return(mock_offer(:update_attributes => true))
        put :update, :id => "1"
        assigns[:offer].should equal(mock_offer)
      end

      it "redirects to the offer" do
        Offer.stub(:find).and_return(mock_offer(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(offer_url(mock_offer))
      end
    end

    describe "with invalid params" do
      it "updates the requested offer" do
        Offer.should_receive(:find).with("37").and_return(mock_offer)
        mock_offer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :offer => {:these => 'params'}
      end

      it "assigns the offer as @offer" do
        Offer.stub(:find).and_return(mock_offer(:update_attributes => false))
        put :update, :id => "1"
        assigns[:offer].should equal(mock_offer)
      end

      it "re-renders the 'edit' template" do
        Offer.stub(:find).and_return(mock_offer(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested offer" do
      Offer.should_receive(:find).with("37").and_return(mock_offer)
      mock_offer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the offers list" do
      Offer.stub(:find).and_return(mock_offer(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(offers_url)
    end
  end

end
