module Domain
  class Game
    attr_reader :id
  
    def initialize
      randomize 
      @game = Persistence::GameData.new(:number => @number)
      @game.user_data_id = 1 #hardcoded for now
      @game.save
      
      @message = "I'm thinking of a random number from 1 to 100. \nCan you guess it? \nEnter a number and hit return."
    end
    
    def self.guess(id, guess)
      @game_data = Persistence::GameData.get(id)
      @game = self.new
      @guess = force_to_number(guess)
      process_answer
    end
    
    def self.find_by_user(user_data_id)
      @game = Persistence::GameData.all(:user_data_id => user_data_id)
    end
    
    def guess_limit
      10
    end
    
    def randomize
      @number = rand(1..101)
    end  
    
    def message
      @message
    end
    
    def process_answer
      if correct?
        respond_for_correct
      else
        respond_for_incorrect
      end
    end
  
    def respond_for_correct
      if guess_count == 1
        @message = "Holy Shit! One guess!! Are you cheating?"
      else
        @message = "You got it! \nIt's about time! It took you #{@guess_count} guesses."
      end
    end
    
    def respond_for_incorrect
      increase_guess_count
      if game_over?
        end_game
        @message = "You lose, Fucker!!"
      elsif too_high?
        @message = "Too high, Try again.."
      elsif too_low?
        @message = "Too low, Try again.."
      else
        @message = "Something went wrong."
      end
    end
    
    def game_over?
       @game.guess_count == guess_limit
    end
    
    def end_game
      #sets status to complete in the db
    end

    def correct?
      @guess == @number
    end
  
    def too_high?
      @guess > @number
    end
  
    def too_low?
      @guess < @number
    end
  
    def increase_guess_count
      @game.attributes = {:guess_count => @game.guess_count += 1 }
      @game.save
    end
  
    def force_to_number(string)
      # This cleans what we receive from command line, 
      # removes all non numbers and converts what's left over into an integer
      # Note: as our app grows, this should be moved to a helper module since it isn't behavior unique to this class
    
      # Currently, this just takes any input (even letters) and does to_i. You could do something like this is clean it:
      # command_line_input.map{|x| x.replace(/[^\d]/g, "").map{|val| val.to_i}}.map{ |y| Range.new(y.first, y.last).to_i}.flatten
      # But ultimately I think you'd want a more robust method aheas of this which responded differntly to improper, non-number input.
      string.to_i
    end

  end
end