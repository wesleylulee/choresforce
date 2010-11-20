require 'spec_helper'

describe "/listings/show.html.erb" do
  include ListingsHelper
  before(:each) do
    assigns[:listing] = @listing = stub_model(Listing,
      :user_id => 1,
      :title => "value for title",
      :category => "value for category",
      :zipcode => 1,
      :description => "value for description",
      :approx_payment => 9.99
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ category/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/9\.99/)
  end
end
