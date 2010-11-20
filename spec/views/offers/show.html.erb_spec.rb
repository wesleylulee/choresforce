require 'spec_helper'

describe "/offers/show.html.erb" do
  include OffersHelper
  before(:each) do
    assigns[:offer] = @offer = stub_model(Offer,
      :user_id => 1,
      :listing_id => 1,
      :amount => 9.99,
      :distance => 9.99
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
  end
end
