require './domain/entites/game'

@game = Game.new # We create a game instance
@game.intro # We start the game.

# The important part of this object approach is that the guts of the fuctionality is hidden inside the class.
# The public only need be aware of the game class to create it and know one method, "start", to interact fully with it.
# As long as the start 