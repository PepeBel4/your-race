# spec/requests/competitions_spec.rb
require 'rails_helper'

RSpec.describe 'Competitions API', type: :request do
  # initialize test data 
  let!(:competitions) { create_list(:competition, 10) }
  let(:competition_id) { competitions.first.id }

  # Test suite for GET /competitions
  describe 'GET /competitions' do
    # make HTTP get request before each example
    before { get '/competitions' }

    it 'returns competitions' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /competitions/:id
  describe 'GET /competitions/:id' do
    before { get "/competitions/#{competition_id}" }

    context 'when the record exists' do
      it 'returns the competition' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(competition_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:competition_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Competition/)
      end
    end
  end

  # Test suite for POST /competitions
  describe 'POST /competitions' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', created_by: '1' } }

    context 'when the request is valid' do
      before { post '/competitions', params: valid_attributes }

      it 'creates a competition' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/competitions', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /competitions/:id
  describe 'PUT /competitions/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/competitions/#{competition_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /competitions/:id
  describe 'DELETE /competitions/:id' do
    before { delete "/competitions/#{competition_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end