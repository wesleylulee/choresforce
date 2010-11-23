require 'spec_helper'

describe "/users/edit.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :new_record? => false,
      :login => "value for login",
      :password => "value for password",
      :zipcode => 1,
      :description => "value for description"
    )
  end

  it "renders the edit user form" do
    render

    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_login[name=?]', "user[login]")
      with_tag('input#user_password[name=?]', "user[password]")
      with_tag('input#user_zipcode[name=?]', "user[zipcode]")
      with_tag('textarea#user_description[name=?]', "user[description]")
    end
  end
end
