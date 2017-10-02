require 'rails_helper'

RSpec.describe "DeviceCoordinates", type: :request do
  describe "GET /device_coordinates" do
    it "works! (now write some real specs)" do
      get device_coordinates_path
      expect(response).to have_http_status(200)
    end
  end
end
