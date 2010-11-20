require 'spec_helper'

describe "/offers/index.html.erb" do
  include OffersHelper

  before(:each) do
    assigns[:offers] = [
      stub_model(Offer,
        :user_id => 1,
        :listing_id => 1,
        :amount => 9.99,
        :distance => 9.99
      ),
      stub_model(Offer,
        :user_id => 1,
        :listing_id => 1,
        :amount => 9.99,
        :distance => 9.99
      )
    ]
  end

  it "renders a list of offers" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end
