require 'spec_helper'

describe "/offers/index.html.erb" do
  include OffersHelper

  before(:each) do
    assigns[:offers] = [
      stub_model(Offer,
        :user_id => 1,
        :listing_id => 1,
        :amount => 9.99,
        :distance => 9.99,
        :accepted => false,
        :listingChanged => false
      ),
      stub_model(Offer,
        :user_id => 1,
        :listing_id => 1,
        :amount => 9.99,
        :distance => 9.99,
        :accepted => false,
        :listingChanged => false
      )
    ]
  end
end
