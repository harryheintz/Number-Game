class User
  include DataMapper::Resource
  has n, :game
  has n, :high_scores
  
  property :id,         Serial
  property :username,   String
  property :first_name, String
  property :last_name,  String
  
end