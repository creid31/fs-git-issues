require 'rails_helper'

RSpec.describe 'Issues', type: :request do
  describe 'GET /issues' do
    it 'works! (now write some real specs)' do
      get issues_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /issues' do
    let(:valid_attributes) { FactoryBot.attributes_for(:issue) }

    context 'when the request is valid' do
      before { post '/issues', params: { issue: valid_attributes } }

      it 'creates a issue' do
        json = JSON.parse(response.body)
        expect(json['github_id']).to eq(valid_attributes[:github_id])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/issues', params: { issue: { number: 2 } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end
end
