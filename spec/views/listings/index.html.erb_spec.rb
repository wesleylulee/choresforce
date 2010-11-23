require 'spec_helper'

describe "/listings/index.html.erb" do
  include ListingsHelper

  before(:each) do
    assigns[:listings] = [
      stub_model(Listing,
        :user_id => 1,
        :title => "value for title",
        :category => "value for category",
        :zipcode => 1,
        :description => "value for description",
        :approx_payment => 9.99
      ),
      stub_model(Listing,
        :user_id => 1,
        :title => "value for title",
        :category => "value for category",
        :zipcode => 1,
        :description => "value for description",
        :approx_payment => 9.99
      )
    ]
  end

  it "renders a list of listings" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for category".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end
