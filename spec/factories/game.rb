FactoryBot.define do
  factory :zero_game, class: 'Game' do
    name {'Game of Bowling'}
    after :create do |game|
      create_list(:roll, 20, pins: 0, game: game)
    end
  end
  factory :ones_game, class: 'Game' do
    name {'Game of Bowling'}
    after :create do |game|
      create_list(:roll, 20, pins: 1, game: game)
    end
  end
  factory :spare_game, class: 'Game' do
    name {'Game of Bowling'}
    after :create do |game|
      create(:roll, pins: 7, game: game)
      create(:roll, pins: 3, game: game)
      create(:roll, pins: 3, game: game)
      create_list(:roll, 17, pins: 0, game: game)
    end
  end
end