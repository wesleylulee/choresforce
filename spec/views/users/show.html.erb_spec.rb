require 'spec_helper'

describe "/users/show.html.erb" do
  include UsersHelper
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :login => "test_worker",
      :password => "000000",
      :zipcode => 94704,
      :description => "My diligence is only surpassed by my apathy for our educational institutions. My experience is my knowledge. I can build pimp dog houses."
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/test_worker/)
    response.should have_text(/94704/)
    response.should have_text(/My diligence is only surpassed by my apathy for our educational institutions. My experience is my knowledge. I can build pimp dog houses./)
  end
end
