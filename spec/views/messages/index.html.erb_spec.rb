require 'spec_helper'

describe "/messages/index.html.erb" do
  include MessagesHelper

  before(:each) do
    assigns[:messages] = [
      stub_model(Message,
        :from => 1,
        :to => 1,
        :listing_id => 1,
        :content => "value for content"
      ),
      stub_model(Message,
        :from => 1,
        :to => 1,
        :listing_id => 1,
        :content => "value for content"
      )
    ]
  end

  it "renders a list of messages" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for content".to_s, 2)
  end
end
