require 'spec_helper'

describe Listing do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :title => "value for title",
      :category => "value for category",
      :description => "value for description",
      :approx_payment => 9.99,
      :created_at => Time.now,
      :updated_at => Time.now,
      :active => false,
      :worker_rating => 1.5,
      :employer_rating => 1.5,
      :address => "value for address",
      :lat => 9.99,
      :lng => 9.99,
      :newOffer => false
    }
  end

  it "should create a new instance given valid attributes" do
    Listing.create!(@valid_attributes)
  end
end
