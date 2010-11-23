require 'spec_helper'

describe "/users/index.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :login => "value for login",
        :email => "value for email",
        :crypted_password => "value for crypted_password",
        :salt => "value for salt",
        :remember_token => "value for remember_token",
        :zipcode => 1,
        :employer_rating => 9.99,
        :num_eratings => 1,
        :worker_rating => 9.99,
        :num_wratings => 1,
        :description => "value for description"
      ),
      stub_model(User,
        :login => "value for login",
        :email => "value for email",
        :crypted_password => "value for crypted_password",
        :salt => "value for salt",
        :remember_token => "value for remember_token",
        :zipcode => 1,
        :employer_rating => 9.99,
        :num_eratings => 1,
        :worker_rating => 9.99,
        :num_wratings => 1,
        :description => "value for description"
      )
    ]
  end

  it "renders a list of users" do
    render
    response.should have_tag("tr>td", "value for login".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for crypted_password".to_s, 2)
    response.should have_tag("tr>td", "value for salt".to_s, 2)
    response.should have_tag("tr>td", "value for remember_token".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
