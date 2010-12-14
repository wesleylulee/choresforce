require 'spec_helper'

describe OffersController do

  before :each do
   controller.stub!(:login_required).and_return(:true)
  end

  def mock_offer(stubs={})
    @mock_offer ||= mock_model(Offer, stubs)
  end
  
  def mock_listing(stubs={})
	@mock_listing ||= mock_model(Listing, stubs)
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
        Offer.stub(:new).with({'these' => 'params'}).and_return(mock_offer(:listing => mock_listing, :amount => 2, :save => true))
		mock_listing.stub(:newOffer=).with(true)
		mock_listing.stub(:save)
        post :create, :offer => {:these => 'params'}
        assigns[:offer].should equal(mock_offer)
      end

      it "saves the listing page" do
        Offer.stub(:new).and_return(mock_offer(:listing => mock_listing, :save => true))
		mock_listing.stub(:newOffer=).with(true)
		mock_listing.stub!(:save)
        post :create, :offer => {}
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved offer as @offer" do
        Offer.stub(:new).with({'these' => 'params'}).and_return(mock_offer(:listing => mock_listing, :save => false))
        post :create, :offer => {:these => 'params'}
        assigns[:offer].should equal(mock_offer)
      end

      it "re-renders the listing page" do
        Offer.stub(:new).and_return(mock_offer(:listing => mock_listing, :save => false))
        post :create, :offer => {}
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested offer" do
        Offer.should_receive(:find).with("37").and_return(mock_offer(:listing => mock_listing))
        mock_offer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :offer => {:these => 'params'}
      end

      it "assigns the requested offer as @offer" do
        Offer.stub(:find).and_return(mock_offer(:listing => mock_listing, :update_attributes => true))
		mock_listing.stub(:newOffer=).with(true)
		mock_listing.stub(:save)
        put :update, :id => "1"
        assigns[:offer].should equal(mock_offer)
      end

      it "saves the listing page" do
        Offer.stub(:new).and_return(mock_offer(:listing => mock_listing, :save => true))
		mock_listing.stub(:newOffer=).with(true)
		mock_listing.stub!(:save)
        post :create, :offer => {}
      end
    end

    describe "with invalid params" do
      it "updates the requested offer" do
        Offer.should_receive(:find).with("37").and_return(mock_offer(:listing => mock_listing))
        mock_offer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :offer => {:these => 'params'}
      end
    end

  end

  describe "DELETE destroy" do
  end

end
