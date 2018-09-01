class GamesController < ApplicationController
  before_action :set_game, only:[:show]
  def create
    @game = Game.new(game_params)
    if @game.save
      render :show, status: :created
    else
      render json: {errors: @game.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: GameSerializer.new(@game).serialized_json, status: :ok
  end

  private

  def game_params
    params.permit(:name)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end