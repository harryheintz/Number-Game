class Game 
  include DataMapper::Resource

  property :id,          Serial
  property :guess_count, Integer, :default => 1
  property :number,      Integer
  property :message,     String
  property :last_guess,  Integer
  property :created_at,  DateTime

  belongs_to :user
end