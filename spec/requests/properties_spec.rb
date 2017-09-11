require 'rails_helper'

RSpec.describe 'Properties API', type: :request do
  let!(:properties) { create_list(:property, 10) }
  let(:id) { properties.first.id }

  describe 'GET /properties' do
    before { get '/properties' }

    it 'returns properties' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /properties/:id' do

    before { get "/properties/#{id}" }

    context 'when the record exists' do
      it 'returns the property' do
        expect(json).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to be_success
      end
    end

    context 'when the record does not exist' do
      let(:id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body)
          .to match(/Couldn't find Property with 'id'=100/)
      end
    end
  end

  describe 'POST /properties' do
    let(:valid_attributes) { { street: 'first street', city: 'Chennai' } }

    context 'when the request is valid' do
      before { post '/properties', params: valid_attributes }

      it 'creates a property' do
        expect(json['street']).to eq('first street')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/properties', params: { street: 'first street' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: City can't be blank/)
      end
    end
  end

  describe 'PUT /properties/:id' do
    let(:valid_attributes) { { street: 'second street' } }

    context 'when the record exists' do
      before { put "/properties/#{id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /properties/:id' do
    before { delete "/properties/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
