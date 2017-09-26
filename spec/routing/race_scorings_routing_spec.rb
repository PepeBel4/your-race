require "rails_helper"

RSpec.describe RaceScoringsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/race_scorings").to route_to("race_scorings#index")
    end


    it "routes to #show" do
      expect(:get => "/race_scorings/1").to route_to("race_scorings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/race_scorings").to route_to("race_scorings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/race_scorings/1").to route_to("race_scorings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/race_scorings/1").to route_to("race_scorings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/race_scorings/1").to route_to("race_scorings#destroy", :id => "1")
    end

  end
end
