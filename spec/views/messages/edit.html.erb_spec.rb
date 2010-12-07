require 'spec_helper'

describe "/messages/edit.html.erb" do
  include MessagesHelper

  before(:each) do
    assigns[:message] = @message = stub_model(Message,
      :new_record? => false,
      :from => 1,
      :to => 1,
      :listing_id => 1,
      :content => "value for content"
    )
  end

  it "renders the edit message form" do
    render

    response.should have_tag("form[action=#{message_path(@message)}][method=post]") do
      with_tag('input#message_from[name=?]', "message[from]")
      with_tag('input#message_to[name=?]', "message[to]")
      with_tag('input#message_listing_id[name=?]', "message[listing_id]")
      with_tag('textarea#message_content[name=?]', "message[content]")
    end
  end
end
