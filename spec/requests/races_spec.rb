# app/requests/races_spec.rb
require 'rails_helper'

RSpec.describe 'races API' do
  # Initialize the test data
  let!(:competition) { create(:competition) }
  let!(:races) { create_list(:race, 20, competition_id: competition.id) }
  let(:competition_id) { competition.id }
  let(:id) { races.first.id }

  # Test suite for GET /competitions/:competition_id/races
  describe 'GET /competitions/:competition_id/races' do
    before { get "/competitions/#{competition_id}/races" }

    context 'when competition exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all competition races' do
        expect(json.size).to eq(20)
      end
    end

    context 'when competition does not exist' do
      let(:competition_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Competition/)
      end
    end
  end

  # Test suite for GET /competitions/:competition_id/races/:id
  describe 'GET /competitions/:competition_id/races/:id' do
    before { get "/competitions/#{competition_id}/races/#{id}" }

    context 'when competition race exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the race' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when competition race does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Race/)
      end
    end
  end

  # Test suite for PUT /competitions/:competition_id/races
  describe 'POST /competitions/:competition_id/races' do
    let(:valid_attributes) { { name: 'Visit Narnia', race_type: 'Qualification', final: false } }

    context 'when request attributes are valid' do
      before { post "/competitions/#{competition_id}/races", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/competitions/#{competition_id}/races", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /competitions/:competition_id/races/:id
  describe 'PUT /competitions/:competition_id/races/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/competitions/#{competition_id}/races/#{id}", params: valid_attributes }

    context 'when race exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the race' do
        updated_race = Race.find(id)
        expect(updated_race.name).to match(/Mozart/)
      end
    end

    context 'when the race does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Race/)
      end
    end
  end

  # Test suite for DELETE /competitions/:id
  describe 'DELETE /competitions/:id' do
    before { delete "/competitions/#{competition_id}/races/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end