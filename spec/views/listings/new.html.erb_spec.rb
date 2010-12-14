require 'spec_helper'

describe "/listings/new.html.erb" do
  include ListingsHelper

  before(:each) do
    assigns[:listing] = stub_model(Listing,
      :new_record? => true,
      :user_id => 1,
      :title => "value for title",
      :category => "value for category",
      :description => "value for description",
      :approx_payment => 9.99,
      :active => false,
      :worker_rating => 1.5,
      :employer_rating => 1.5,
      :lat => 9.99,
      :lng => 9.99,
      :newOffer => false
    )
  end
end
