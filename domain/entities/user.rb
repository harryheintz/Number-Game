module Domain
  class User
    attr_reader :high_scores
    attr_accessor :first_name, :last_name
  
    def initialize
      @user = Persistence::UserData.first_or_create(:username)
    end
    
    def high_scores
      @user.high_scores
    end

  end
end