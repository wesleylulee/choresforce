require 'spec_helper'

describe "/users/new.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = stub_model(User,
      :new_record? => true,
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

  it "renders new user form" do
    render

    response.should have_tag("form[action=?][method=post]", users_path) do
      with_tag("input#user_login[name=?]", "user[login]")
      with_tag("input#user_email[name=?]", "user[email]")
      with_tag("input#user_crypted_password[name=?]", "user[crypted_password]")
      with_tag("input#user_salt[name=?]", "user[salt]")
      with_tag("input#user_remember_token[name=?]", "user[remember_token]")
      with_tag("input#user_zipcode[name=?]", "user[zipcode]")
      with_tag("input#user_employer_rating[name=?]", "user[employer_rating]")
      with_tag("input#user_num_eratings[name=?]", "user[num_eratings]")
      with_tag("input#user_worker_rating[name=?]", "user[worker_rating]")
      with_tag("input#user_num_wratings[name=?]", "user[num_wratings]")
      with_tag("textarea#user_description[name=?]", "user[description]")
    end
  end
end
