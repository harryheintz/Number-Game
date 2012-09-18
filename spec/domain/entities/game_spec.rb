
require './spec/domain/spec_helper'
require './domain/entities/game'

# class Player
#   # This is for later when we start to have a Player class concept
#   def initialize
#     @name = ""
#   end
# end

describe Game do
  
  before :each do
    @game = Game.new
    @number = 10
  end
  
  describe "#new" do
    it "creates a new game scenario" do
      @game.should be_an_instance_of Game
    end
  end
  
  describe "accepting name input" do
    it "should accept name" do
      entered_command("Frank")
      @name.should == 'Frank'
    end
    
    it "should capitalize name" do
      entered_command("frank")
      @name.should == 'Frank'
    end
    
    it "should translate all caps to camelcase" do
      entered_command("FRANK")
      @name.should == 'Frank'
    end
  end
  
  describe "guessing game play" do
    it "should respond with too high" do
      entered_command("11")
      game_response.should_be "Too high, Try again.."
    end
    
    it "should respond with too low" do
      entered_command("9")
      game_response.should_be "Too low, Try again.."
    end
  end
end