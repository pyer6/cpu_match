class Character
  attr_accessor :hp, :defense, :power
  attr_reader :name

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @power = params[:power]

    @defense = "false"
    @standard_power = params[:power]
  end
end

class User < Character

  def attack(cpu)
    damage = @power
    damage *= 0.8 if cpu.defense == "true"
    cpu.hp -= damage
    cpu.hp = 0 if cpu.hp < 0
    puts <<~TEXT

    #{@name}がアッタクを選択。
    #{@name}は#{cpu.name}に、#{damage}のダメージを与えた。
    #{cpu.name}の残りHPは#{cpu.hp}だ。

    TEXT

    @power = @standard_power
  end

  def charge(cpu)
    @power *= 2.5
    puts <<~TEXT

    #{@name}はチャージを選択。
    攻撃力が上がった。

    TEXT
  end

  def protect(cpu)
    @defense = "true"
    puts <<~TEXT

    #{@name}がプロテクトを選択。
    #{@name}は防御態勢に入った。

    TEXT
  end
end


class Cpu < Character
  def attack(user)
    damage = @power
    damage *= 0.8  if user.defense == "true"
    user.hp -= damage
    user.hp = 0 if user.hp < 0 
    
    puts <<~TEXT

    #{@name}がアッタクを選択。
    #{@name}は#{user.name}に、#{damage}のダメージを与えた。
    #{user.name}の残りHPは#{user.hp}だ。

    TEXT
    @power = @standard_power
  end

  def charge(user)
    @power *= 2.5

    puts <<~TEXT
    #{@name}はチャージを選択。
    攻撃力が上がった。

    TEXT
  end

  def protect(user)
    @defense = "true"

    puts <<~TEXT

    #{@name}がプロテクトを選択。
    #{@name}は防御態勢に入った。

    TEXT
  end
end


user = User.new(name: "サントス", hp: 200, power: 20)
cpu = Cpu.new(name: "CPU1", hp: 100, power: 10)




def choice(**params)
  array = [1,1,1,1,1,1,2,2,3,3]

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


loop do
  puts "#{user.name}のターン"
  choice(oneself: user, opponent: cpu)
  break if cpu.hp == 0

  puts "#{cpu.name}のターン"
  choice(oneself: cpu, opponent: user)
  break if user.hp == 0
end