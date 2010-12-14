require 'spec_helper'

describe "/listings/index.html.erb" do
  include ListingsHelper

  before(:each) do
    assigns[:listings] = [
      stub_model(Listing,
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
      ),
      stub_model(Listing,
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
    ]
  end

end
