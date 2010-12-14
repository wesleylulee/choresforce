require 'spec_helper'

describe "/messages/edit.html.erb" do
  include MessagesHelper

  before(:each) do
    assigns[:message] = @message = stub_model(Message,
      :new_record? => false,
      :from => 1,
      :to => 1,
      :listing_id => 1,
      :content => "value for content",
      :unread => false
    )
  end
end
