require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :login => "value for login",
      :password => "value for password",
      :zipcode => 1,
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
