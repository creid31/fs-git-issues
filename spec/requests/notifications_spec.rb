require 'rails_helper'

RSpec.describe 'Notifications', type: :request do
  describe 'POST /notify' do
    valid_attributes = { issue: {
                           url: Faker::Internet.url('github.com'),
                           number: Faker::Number.number(1),
                           id: Faker::Number.number(10) } }

    context 'when the request is valid' do
      it 'creates a issue' do
        count = Issue.count
        post '/notify', params: valid_attributes
        expect(Issue.count).to eq(count + 1)
      end

      it 'returns status code 204' do
        post '/notify', params: valid_attributes
        expect(response).to have_http_status(204)
      end
    end

    context 'when the request is invalid' do
      before { post '/notify', params: {issue: {invalid: 'test'}} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
