require 'spec_helper'

describe "/listings/edit.html.erb" do
  include ListingsHelper

  before(:each) do
    assigns[:listing] = @listing = stub_model(Listing,
      :new_record? => false,
      :user_id => 1,
      :title => "value for title",
      :category => "value for category",
      :description => "value for description",
      :approx_payment => 9.99,
      :active => false,
      :worker_rating => 1.5,
      :employer_rating => 1.5,
      :address => "value for address",
      :lat => 9.99,
      :lng => 9.99,
      :newOffer => false
    )
  end
end
