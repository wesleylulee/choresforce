require 'spec_helper'

describe Message do
  before(:each) do
    @valid_attributes = {
      :from => 1,
      :to => 1,
      :listing_id => 1,
      :content => "value for content"
    }
  end

  it "should create a new instance given valid attributes" do
    Message.create!(@valid_attributes)
  end
end
