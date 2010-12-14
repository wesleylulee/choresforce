require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :login => "loginvalue",
      :email => "email@email.com",
      :password => "value for crypted_password",
	  :password_confirmation => "value for crypted_password",
      :created_at => Time.now,
      :updated_at => Time.now,
      :remember_token => "value for remember_token",
      :remember_token_expires_at => Time.now,
      :employer_rating => 9.99,
      :num_eratings => 1,
      :worker_rating => 9.99,
      :num_wratings => 1,
      :description => "value for description",
      :address => "1 Infinite Loop Cupertino, CA 95015",
      :lat => 9.99,
      :lng => 9.99
    }
  end
 end
