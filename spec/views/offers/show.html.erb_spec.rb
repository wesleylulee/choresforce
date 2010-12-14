require 'spec_helper'

describe "/offers/show.html.erb" do
  include OffersHelper
  before(:each) do
    assigns[:offer] = @offer = stub_model(Offer,
      :user_id => 1,
      :listing_id => 1,
      :amount => 9.99,
      :distance => 9.99,
      :accepted => false,
      :listingChanged => false
    )
  end
end
