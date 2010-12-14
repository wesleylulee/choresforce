require 'spec_helper'

describe "/messages/index.html.erb" do
  include MessagesHelper

  before(:each) do
    assigns[:messages] = [
      stub_model(Message,
        :from => 1,
        :to => 1,
        :listing_id => 1,
        :content => "value for content",
        :unread => false
      ),
      stub_model(Message,
        :from => 1,
        :to => 1,
        :listing_id => 1,
        :content => "value for content",
        :unread => false
      )
    ]
  end
end
