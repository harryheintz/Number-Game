module Domain
  class Game
    #attr_reader :id, :message
    attr_writer :start
  
    def initialize
      randomize 
      @game = Persistence::GameData.create(:number => @number)
      
      # @guess_count = 1 # Because you can't win with 0 guesses, so there will always be at least one
      # ^ now in the database
      @guess_limit = 10
    end

    def intro
      puts "Hello there! \nI'm glad you stopped by. \nIf I may ask, what is your name?"
      @name = gets.capitalize 
      puts "Well hello there, #{@name}  Would you like to play a number game with me? \n1 = Yes, please! \n2 = Nah, I gotta clean my toothbrush"
      decision
    end
    
    def randomize
      @number = rand(1..101)
    end  
  
    def decision
      @query = gets.to_i
      if @query == 1
        puts "Great! Let's do it! \n\n\n\n\n\n"
        start
      else
        quit
      end
    end
  
    def quit
      puts "Ok then, chicken shit... PEACE!!"
      exit
    end
      
    def start
      message = "I'm thinking of a random number from 1 to 100. \nCan you guess it? \nEnter a number and hit return."
      receive(gets)
    end
    
  
    def receive(guess)
      @guess = force_to_number(guess)
      if @guess > 100
        puts "\n \n \n \n Are you retarded? Let's try this again... \n \n \n \n"
        start
      else
      process_answer
    end
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
      if @guess_count == 1
        puts "Holy Shit! One guess!! Are you cheating?"
        play_again
      else
        puts "You got it! \nIt's about time! It took you #{@guess_count} guesses."
        play_again
      
      end
    end
    
    def respond_for_incorrect
      if @guess_count == @guess_limit
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
  
    def play_again
      puts "Would you like to play again? (Enter 1 for yes, 2 for no)"
      @answer = gets.to_i
      reset_game
    end
  
    def reset_game
      if @answer == 1
        puts "Ok... here we go! \n\n"
        @guess_count = 1
        randomize
        start
      else
        quit 
      end
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