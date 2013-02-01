class HighScore
  include DataMapper::Resource
  belongs_to :user
  property :id,      Serial
  property :score,   Integer
end