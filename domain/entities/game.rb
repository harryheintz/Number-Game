module Domain
  class Game
    attr_reader :id, :message
  
    def initialize
      randomize 
      @game = Persistence::GameData.create(:number => @number)
      @game.guess_count = 1
      #@game.message = "I'm thinking of a random number from 1 to 100. \nCan you guess it? \nEnter a number and hit return."
      @game.user_data_id = 1
      @game.save
    end
    
    def self.find(id)
      @game = Persistence::GameData.first(:id => id)
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
    
    def start
      message = "I'm thinking of a random number from 1 to 100. \nCan you guess it? \nEnter a number and hit return."
      receive(gets)
    end
    
    def receive(guess)
      @guess = force_to_number(guess)
      #if @guess > 100
       # puts "\n \n \n \n Are you retarded? Let's try this again... \n \n \n \n"
        #start
      #else
      process_answer
    #end
    end
    
    def process_answer
      if correct?
        respond_for_correct
        exit
      else
        respond_for_incorrect
      end
    end
  
    def respond_for_correct
      if guess_count == 1
        puts "Holy Shit! One guess!! Are you cheating?"
        play_again
      else
        puts "You got it! \nIt's about time! It took you #{@guess_count} guesses."
        play_again
      
      end
    end
    
    def respond_for_incorrect
      if guess_count == guess_limit
        puts "You lose, Fucker!!"
        play_again
      else
      increase_guess_count
      end
      if too_high?
        puts "Too high, Try again.."
        receive(gets)
      elsif too_low?
        puts "Too low, Try again.."
        receive(gets)
      end
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
      @guess_count += 1
    end
  
    def force_to_number(command_line_input)
      # This cleans what we receive from command line, 
      # removes all non numbers and converts what's left over into an integer
      # Note: as our app grows, this should be moved to a helper module since it isn't behavior unique to this class
    
      # Currently, this just takes any input (even letters) and does to_i. You could do something like this is clean it:
      # command_line_input.map{|x| x.replace(/[^\d]/g, "").map{|val| val.to_i}}.map{ |y| Range.new(y.first, y.last).to_i}.flatten
      # But ultimately I think you'd want a more robust method aheas of this which responded differntly to improper, non-number input.
      command_line_input.to_i
    end

  end
end