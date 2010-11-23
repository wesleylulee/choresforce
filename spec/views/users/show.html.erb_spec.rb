require 'spec_helper'

describe "/users/show.html.erb" do
  include UsersHelper
  before(:each) do
    assigns[:user] = @user = stub_model(User,
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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ login/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ crypted_password/)
    response.should have_text(/value\ for\ salt/)
    response.should have_text(/value\ for\ remember_token/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ description/)
  end
end
