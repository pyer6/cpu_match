class GamesController
  
  include MessageDialog

  def battle(**params)
    user = params[:user]
    cpu = params[:cpu]

    loop do
      puts "-------------#{user.name}のターン-------------"
      pattern_choice(oneself: user, opponent: cpu)
      break if cpu.hp == 0

      puts "-------------#{cpu.name}のターン-------------"
      pattern_choice(oneself: cpu, opponent: user)
      break if user.hp == 0
    end

    user_winner?(user)
  end

  private

    def pattern_choice(**params)
      array = [1,1,1,1,1,1,2,2,3.3]
    
      @oneself = params[:oneself]
      @opponent = params[:opponent]
    
      num = array.sample
    
      if num == 1
        @oneself.attack(@opponent)
      elsif num == 2
        @oneself.charge(@opponent)
      else
        @oneself.protect(@opponent)
      end
    end

    def user_winner?(user)

      end_message(user)
    end
end