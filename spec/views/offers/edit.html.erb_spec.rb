require 'spec_helper'

describe "/offers/edit.html.erb" do
  include OffersHelper

  before(:each) do
    assigns[:offer] = @offer = stub_model(Offer,
      :new_record? => false,
      :user_id => 1,
      :listing_id => 1,
      :amount => 9.99,
      :distance => 9.99
    )
  end

  it "renders the edit offer form" do
    render

    response.should have_tag("form[action=#{offer_path(@offer)}][method=post]") do
      with_tag('input#offer_user_id[name=?]', "offer[user_id]")
      with_tag('input#offer_listing_id[name=?]', "offer[listing_id]")
      with_tag('input#offer_amount[name=?]', "offer[amount]")
      with_tag('input#offer_distance[name=?]', "offer[distance]")
    end
  end
end
