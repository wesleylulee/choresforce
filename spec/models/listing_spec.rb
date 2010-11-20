require 'spec_helper'

describe Listing do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :title => "value for title",
      :category => "value for category",
      :zipcode => 1,
      :description => "value for description",
      :approx_payment => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    Listing.create!(@valid_attributes)
  end
end
