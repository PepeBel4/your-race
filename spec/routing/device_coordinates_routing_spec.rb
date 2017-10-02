require "rails_helper"

RSpec.describe DeviceCoordinatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/device_coordinates").to route_to("device_coordinates#index")
    end


    it "routes to #show" do
      expect(:get => "/device_coordinates/1").to route_to("device_coordinates#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/device_coordinates").to route_to("device_coordinates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/device_coordinates/1").to route_to("device_coordinates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/device_coordinates/1").to route_to("device_coordinates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/device_coordinates/1").to route_to("device_coordinates#destroy", :id => "1")
    end

  end
end
