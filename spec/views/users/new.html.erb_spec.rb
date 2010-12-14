require 'spec_helper'

describe "/users/new.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = stub_model(User,
      :new_record? => true,
      :login => "value for login",
      :email => "value for email",
      :crypted_password => "value for crypted_password",
      :remember_token => "value for remember_token",
      :employer_rating => 9.99,
      :num_eratings => 1,
      :worker_rating => 9.99,
      :num_wratings => 1,
      :description => "value for description",
      :address => "value for address",
      :lat => 9.99,
      :lng => 9.99
    )
  end
end
