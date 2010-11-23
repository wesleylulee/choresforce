require 'spec_helper'

describe OffersController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/offers" }.should route_to(:controller => "offers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/offers/new" }.should route_to(:controller => "offers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/offers/1" }.should route_to(:controller => "offers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/offers/1/edit" }.should route_to(:controller => "offers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/offers" }.should route_to(:controller => "offers", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/offers/1" }.should route_to(:controller => "offers", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/offers/1" }.should route_to(:controller => "offers", :action => "destroy", :id => "1") 
    end
  end
end
