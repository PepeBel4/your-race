require 'rails_helper'

RSpec.describe "RaceScorings", type: :request do
  describe "GET /race_scorings" do
    it "works! (now write some real specs)" do
      get race_scorings_path
      expect(response).to have_http_status(200)
    end
  end
end
