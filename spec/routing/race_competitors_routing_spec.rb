require "rails_helper"

RSpec.describe RaceCompetitorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/race_competitors").to route_to("race_competitors#index")
    end


    it "routes to #show" do
      expect(:get => "/race_competitors/1").to route_to("race_competitors#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/race_competitors").to route_to("race_competitors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/race_competitors/1").to route_to("race_competitors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/race_competitors/1").to route_to("race_competitors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/race_competitors/1").to route_to("race_competitors#destroy", :id => "1")
    end

  end
end
