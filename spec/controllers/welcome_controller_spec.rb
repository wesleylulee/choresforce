require 'spec_helper'

describe WelcomeController do

  #Delete these examples and add some real ones
  it "should use WelcomeController" do
    controller.should be_an_instance_of(WelcomeController)
  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
end
