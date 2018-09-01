require 'rails_helper'

RSpec.describe 'Game API', type: :request do
  let(:game) { create(:game) }
  describe 'post /v1/games' do
    it 'creates a new game' do
      post '/v1/games', params: {name: 'Game 1'}
      expect(response).to have_http_status(201)
    end
  end
  describe 'get /v1/games/:id/' do
    it 'shows the game name and score' do
      get "/v1/games/#{game.id}"
      expect(response).to have_http_status(200)
      expect(json['data']['attributes']['score']).to eq(0)
    end
  end
end