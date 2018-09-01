require 'rails_helper'

RSpec.describe 'Creates a new game', type: :request do
  describe 'post /v1/games' do
    it 'creates a new game' do
      post '/v1/games', params: {name: 'Game 1'}
      expect(response).to have_http_status(201)
    end
  end
end