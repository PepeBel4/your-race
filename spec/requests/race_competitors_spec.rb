require 'rails_helper'

RSpec.describe "RaceCompetitors", type: :request do
  describe "GET /race_competitors" do
    it "works! (now write some real specs)" do
      get race_competitors_path
      expect(response).to have_http_status(200)
    end
  end
end
