require 'spec_helper'

describe "/listings/new.html.erb" do
  include ListingsHelper

  before(:each) do
    assigns[:listing] = stub_model(Listing,
      :new_record? => true,
      :user_id => 1,
      :title => "value for title",
      :category => "value for category",
      :zipcode => 1,
      :description => "value for description",
      :approx_payment => 9.99
    )
  end

  it "renders new listing form" do
    render

    response.should have_tag("form[action=?][method=post]", listings_path) do
      with_tag("input#listing_user_id[name=?]", "listing[user_id]")
      with_tag("input#listing_title[name=?]", "listing[title]")
      with_tag("input#listing_category[name=?]", "listing[category]")
      with_tag("input#listing_zipcode[name=?]", "listing[zipcode]")
      with_tag("textarea#listing_description[name=?]", "listing[description]")
      with_tag("input#listing_approx_payment[name=?]", "listing[approx_payment]")
    end
  end
end
