require 'rails_helper'

RSpec.describe "Scorings", type: :request do
  describe "GET /scorings" do
    it "works! (now write some real specs)" do
      get scorings_path
      expect(response).to have_http_status(200)
    end
  end
end
