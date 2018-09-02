class Game < ApplicationRecord
  validates :name, presence: true

  has_many :rolls, -> { order('number asc') }

  def score
    result = 0
    roll_number = 0
    10.times do
      if is_spare?(roll_number)
        result += rolls[roll_number].pins + rolls[roll_number + 1].pins + rolls[roll_number + 2].pins
      else
        result += frame_score(roll_number)
      end
      roll_number += 2
    end
    result
  end

  def is_spare?(roll_number)
    rolls[roll_number].pins + rolls[roll_number + 1].pins == 10
  end

  def frame_score(roll_number)
    rolls[roll_number].pins + rolls[roll_number + 1].pins
  end

  
end
