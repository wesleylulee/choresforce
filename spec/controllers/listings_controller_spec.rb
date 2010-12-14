require 'spec_helper'

describe ListingsController do

  # before :each do
   # @current_user = mock_model(User, :id => 1)
   # controller.stub!(:current_user).and_return(@current_user)
   # controller.stub!(:login_required).and_return(:true)
  # end
  # fixtures :users

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
	  mock_listing.stub(:active).and_return(true)
      get :show, :id => "37"
      assigns[:listing].should equal(mock_listing)
    end
  end

  describe "GET new" do
    it "assigns a new listing as @listing" do
	  controller.stub!(:login_required).and_return(:true)
      Listing.stub(:new).and_return(mock_listing)
      get :new
      assigns[:listing].should equal(mock_listing)
    end
  end

  describe "GET edit" do
  end

  describe "POST create" do

    describe "with valid params" do

      it "redirects to the created listing" do
      end
    end

    describe "with invalid params" do
    end

  end

  describe "PUT update" do

    describe "with valid params" do
    end

    describe "with invalid params" do
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested listing" do
	  controller.stub!(:login_required).and_return(:true)
      Listing.should_receive(:find).with("37").and_return(mock_listing)
      mock_listing.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the listings list" do
	  controller.stub!(:login_required).and_return(:true)
      Listing.stub(:find).and_return(mock_listing(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(listings_url)
    end
  end

end
