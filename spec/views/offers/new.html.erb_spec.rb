require 'spec_helper'

describe "/offers/new.html.erb" do
  include OffersHelper

  before(:each) do
    assigns[:offer] = stub_model(Offer,
      :new_record? => true,
      :user_id => 1,
      :listing_id => 1,
      :amount => 9.99,
      :distance => 9.99
    )
  end

  it "renders new offer form" do
    render

    response.should have_tag("form[action=?][method=post]", offers_path) do
      with_tag("input#offer_user_id[name=?]", "offer[user_id]")
      with_tag("input#offer_listing_id[name=?]", "offer[listing_id]")
      with_tag("input#offer_amount[name=?]", "offer[amount]")
      with_tag("input#offer_distance[name=?]", "offer[distance]")
    end
  end
end
