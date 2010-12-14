require 'spec_helper'

describe "/messages/new.html.erb" do
  include MessagesHelper

  before(:each) do
    assigns[:message] = stub_model(Message,
      :new_record? => true,
      :from => 1,
      :to => 1,
      :listing_id => 1,
      :content => "value for content",
      :unread => false
    )
  end

end
