module Persistence 
  class UserData
    include DataMapper::Resource
    has n, :game_data
    has n, :high_scores
    
    property :username, String, :require => true
    property :first_name, String
    property :last_name, String
    
  end
  
  class HighScore #this does not shine directly through to Domain, instead you get that data from UserData
    include DataMapper::Resource
    belongs_to :user_data
    property :score, Integer
    
  end
end