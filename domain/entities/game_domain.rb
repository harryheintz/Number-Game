class Game
  
  def self.start(user_id = 1)
    game = create(:user_id => user_id)
    game.message = "I'm thinking of a random number from 1 to 100. Can you guess it? Enter a number and hit return."
    game.randomize
    game.save
    game
  end
  
  def self.guess(id, guess)
    game = get(id.to_i)
    game.last_guess = guess.to_i
    game.save
    game.process_answer
    game.save
    game
  end
  
  def self.find_by_user(user_data_id)
    all(:user_data_id => user_data_id)
  end
  
  def guess_limit
    10
  end
  
  def randomize
    self.number = rand(1..101)
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
      self.message = "Holy Shit! One guess!! Are you cheating?"
    else
      self.message = "You got it! It's about time! It took you #{@guess_count} guesses."
    end
  end
  
  def respond_for_incorrect
    increase_guess_count
    if game_over?
      end_game
      self.message = "You lose, Fucker!!"
    elsif too_high?
      self.message = "Too high, Try again.."
    elsif too_low?
      self.message = "Too low, Try again.."
    else
      self.message = "Something went wrong."
    end
  end
  
  def game_over?
     self.guess_count == guess_limit
  end
  
  def end_game
    #sets status to complete in the db
  end

  def correct?
    self.last_guess == self.number
  end

  def too_high?
    self.last_guess > self.number
  end

  def too_low?
    self.last_guess < self.number
  end

  def increase_guess_count
    self.attributes = {:guess_count => self.guess_count += 1 }
    self.save
  end

end