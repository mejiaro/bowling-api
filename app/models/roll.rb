class Roll < ApplicationRecord
  belongs_to :game

  before_create :set_index

  def set_index
    last_roll = game.rolls.maximum(:number)
    self.number = last_roll.to_i + 1
  end
end
