require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { Game.new }
  it { should validate_presence_of(:name) }
end
