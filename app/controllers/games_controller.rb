class GamesController < ApplicationController
  def create
    @game = Game.new(game_params)
    if @game.save
      render :show, status: :created
    else
      render json: {errors: @game.errors }, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.permit(:name)
  end
end