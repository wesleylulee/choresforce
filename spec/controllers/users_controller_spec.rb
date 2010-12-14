require 'spec_helper'

describe UsersController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
	  controller.stub!(:login_required).and_return(:true)
      User.stub(:find).with("37").and_return(mock_user)
      get :show, :id => "37"
      assigns[:user].should equal(mock_user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      User.stub(:new).and_return(mock_user)
      get :new
      assigns[:user].should equal(mock_user)
    end
  end

  describe "POST create" do

    describe "with valid params" do
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
    it "destroys the requested user" do
	  @current_user = mock_model(User, :id => 37)
	  controller.stub!(:current_user).and_return(@current_user)
	  controller.stub!(:login_required).and_return(:true)
      @current_user.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  end

end
