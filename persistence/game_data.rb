module Persistence ## Persistence::GameData
  class GameData ## table would be named game_data
    include DataMapper::Resource
    
    property :id,          Serial
    property :guess_count, Integer
    property :number,      Integer
    property :created_at,  DateTime
    
    belongs_to :user_data
    
  end
end

# Persistence::GameData.id