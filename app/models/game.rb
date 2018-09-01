class Game < ApplicationRecord
  validates :name, presence: true

  def score
    0
  end
end
