require 'rails_helper'

RSpec.describe 'Game API', type: :request do
  describe 'post /v1/games' do
    it 'creates a new game' do
      post '/v1/games', params: {name: 'Game 1'}
      expect(response).to have_http_status(201)
    end
  end
  describe 'get /v1/games/:id/' do
    let(:zero_game) { create(:zero_game) }
    it 'shows the game name and score for a 0 score game' do
      get "/v1/games/#{zero_game.id}"
      expect(response).to have_http_status(200)
      expect(json['data']['attributes']['score']).to eq(0)
    end
  end
  describe 'get /v1/games/:id/' do
    let(:ones_game) { create(:ones_game) }
    it 'shows the game name and score for a 0 score game' do
      get "/v1/games/#{ones_game.id}"
      p json
      expect(response).to have_http_status(200)
      expect(json['data']['attributes']['score']).to eq(20)
    end
  end
  describe 'get /v1/games/:id/' do
    let(:spare_game) { create(:spare_game) }
    it 'shows the game name and score for a 1 spare game' do
      get "/v1/games/#{spare_game.id}"
      p json
      expect(response).to have_http_status(200)
      expect(json['data']['attributes']['score']).to eq(16)
    end
  end


  # describe 'post /v1/games/:id/frames' do
  #   let(:ones_game) { create(:ones_game) }
  #   it 'creates 10 frames with score 20 for the game' do
  #     post "/v1/games/#{ones_game.id}/frames"
  #     expect(response).to have_http_status(201)
  #     expect(json['data']['attributes']['score']).to eq(0)
  #   end
  # end

end