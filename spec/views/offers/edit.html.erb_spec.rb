require 'spec_helper'

describe "/offers/edit.html.erb" do
  include OffersHelper

  before(:each) do
    assigns[:offer] = @offer = stub_model(Offer,
      :new_record? => false,
      :user_id => 1,
      :listing_id => 1,
      :amount => 9.99,
      :distance => 9.99,
      :accepted => false,
      :listingChanged => false
    )
  end
end
