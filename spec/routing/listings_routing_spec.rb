require 'spec_helper'

describe ListingsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/listings" }.should route_to(:controller => "listings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/listings/new" }.should route_to(:controller => "listings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/listings/1" }.should route_to(:controller => "listings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/listings/1/edit" }.should route_to(:controller => "listings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/listings" }.should route_to(:controller => "listings", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/listings/1" }.should route_to(:controller => "listings", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/listings/1" }.should route_to(:controller => "listings", :action => "destroy", :id => "1") 
    end
  end
end
