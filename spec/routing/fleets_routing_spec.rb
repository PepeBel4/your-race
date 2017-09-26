require "rails_helper"

RSpec.describe FleetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fleets").to route_to("fleets#index")
    end


    it "routes to #show" do
      expect(:get => "/fleets/1").to route_to("fleets#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/fleets").to route_to("fleets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fleets/1").to route_to("fleets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fleets/1").to route_to("fleets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fleets/1").to route_to("fleets#destroy", :id => "1")
    end

  end
end
