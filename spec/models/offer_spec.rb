require 'spec_helper'

describe Offer do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :listing_id => 1,
      :amount => 9.99,
      :distance => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    Offer.create!(@valid_attributes)
  end
end
