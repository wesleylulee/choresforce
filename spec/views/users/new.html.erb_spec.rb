require 'spec_helper'

describe "/users/new.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = stub_model(User,
      :new_record? => true,
      :login => "value for username",
      :zipcode => 1,
      :description => "value for description"
    )
  end

  it "renders new user form" do
    render

    response.should have_tag("form[action=?][method=post]", users_path) do
      with_tag("input#user_login[name=?]", "user[login]")
      with_tag("input#user_password[name=?]", "user[password]")
      with_tag("input#user_zipcode[name=?]", "user[zipcode]")
      with_tag("textarea#user_description[name=?]", "user[description]")
    end
  end
end
