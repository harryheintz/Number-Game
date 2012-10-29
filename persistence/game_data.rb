module Persistence ## Persistence::GameData
  class GameData ## table would be named game_data
    include DataMapper::Resource
    property :id, Serial
    property :guess_count, Integer, :default  => 1
    property :number, Integer
    
    belongs_to, :user_data
  end
end