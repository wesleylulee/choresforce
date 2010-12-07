require 'spec_helper'

describe "/messages/new.html.erb" do
  include MessagesHelper

  before(:each) do
    assigns[:message] = stub_model(Message,
      :new_record? => true,
      :from => 1,
      :to => 1,
      :listing_id => 1,
      :content => "value for content"
    )
  end

  it "renders new message form" do
    render

    response.should have_tag("form[action=?][method=post]", messages_path) do
      with_tag("input#message_from[name=?]", "message[from]")
      with_tag("input#message_to[name=?]", "message[to]")
      with_tag("input#message_listing_id[name=?]", "message[listing_id]")
      with_tag("textarea#message_content[name=?]", "message[content]")
    end
  end
end
