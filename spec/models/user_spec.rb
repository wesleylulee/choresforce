require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :login => "value for login",
      :email => "value for email",
      :crypted_password => "value for crypted_password",
      :salt => "value for salt",
      :remember_token => "value for remember_token",
      :remember_token_expires_at => Time.now,
      :zipcode => 1,
      :employer_rating => 9.99,
      :num_eratings => 1,
      :worker_rating => 9.99,
      :num_wratings => 1,
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
