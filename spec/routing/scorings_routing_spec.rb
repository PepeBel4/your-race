require "rails_helper"

RSpec.describe ScoringsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/scorings").to route_to("scorings#index")
    end


    it "routes to #show" do
      expect(:get => "/scorings/1").to route_to("scorings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/scorings").to route_to("scorings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/scorings/1").to route_to("scorings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/scorings/1").to route_to("scorings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scorings/1").to route_to("scorings#destroy", :id => "1")
    end

  end
end
