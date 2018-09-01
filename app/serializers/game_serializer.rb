class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :score, :name
end
