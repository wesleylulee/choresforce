require 'spec_helper'

describe "/messages/show.html.erb" do
  include MessagesHelper
  before(:each) do
    assigns[:message] = @message = stub_model(Message,
      :from => 1,
      :to => 1,
      :listing_id => 1,
      :content => "value for content",
      :unread => false
    )
  end
end
