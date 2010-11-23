require 'spec_helper'

describe ListingsController do

  def mock_listing(stubs={})
    @mock_listing ||= mock_model(Listing, stubs)
  end

  describe "GET index" do
    it "assigns all listings as @listings" do
      Listing.stub(:find).with(:all).and_return([mock_listing])
      get :index
      assigns[:listings].should == [mock_listing]
    end
  end

  describe "GET show" do
    it "assigns the requested listing as @listing" do
      Listing.stub(:find).with("37").and_return(mock_listing)
      get :show, :id => "37"
      assigns[:listing].should equal(mock_listing)
    end
  end

  describe "GET new" do
    it "assigns a new listing as @listing" do
      Listing.stub(:new).and_return(mock_listing)
      get :new
      assigns[:listing].should equal(mock_listing)
    end
  end

  describe "GET edit" do
    it "assigns the requested listing as @listing" do
      Listing.stub(:find).with("37").and_return(mock_listing)
      get :edit, :id => "37"
      assigns[:listing].should equal(mock_listing)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created listing as @listing" do
        Listing.stub(:new).with({'these' => 'params'}).and_return(mock_listing(:save => true))
        post :create, :listing => {:these => 'params'}
        assigns[:listing].should equal(mock_listing)
      end

      it "redirects to the created listing" do
        Listing.stub(:new).and_return(mock_listing(:save => true))
        post :create, :listing => {}
        response.should redirect_to(listing_url(mock_listing))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved listing as @listing" do
        Listing.stub(:new).with({'these' => 'params'}).and_return(mock_listing(:save => false))
        post :create, :listing => {:these => 'params'}
        assigns[:listing].should equal(mock_listing)
      end

      it "re-renders the 'new' template" do
        Listing.stub(:new).and_return(mock_listing(:save => false))
        post :create, :listing => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested listing" do
        Listing.should_receive(:find).with("37").and_return(mock_listing)
        mock_listing.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :listing => {:these => 'params'}
      end

      it "assigns the requested listing as @listing" do
        Listing.stub(:find).and_return(mock_listing(:update_attributes => true))
        put :update, :id => "1"
        assigns[:listing].should equal(mock_listing)
      end

      it "redirects to the listing" do
        Listing.stub(:find).and_return(mock_listing(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(listing_url(mock_listing))
      end
    end

    describe "with invalid params" do
      it "updates the requested listing" do
        Listing.should_receive(:find).with("37").and_return(mock_listing)
        mock_listing.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :listing => {:these => 'params'}
      end

      it "assigns the listing as @listing" do
        Listing.stub(:find).and_return(mock_listing(:update_attributes => false))
        put :update, :id => "1"
        assigns[:listing].should equal(mock_listing)
      end

      it "re-renders the 'edit' template" do
        Listing.stub(:find).and_return(mock_listing(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested listing" do
      Listing.should_receive(:find).with("37").and_return(mock_listing)
      mock_listing.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the listings list" do
      Listing.stub(:find).and_return(mock_listing(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(listings_url)
    end
  end

end
