require './character'

class Cpu < Character
  def attack(user)
    damage = calculate_damage(user)
    user.hp -= damage
    user.hp = 0 if user.hp < 0

    attack_message(damage: damage, opponent: user)
    
    @power = @standard_power if @power != @standard_power
  end

  def charge(user)
    @power *= 2.5

    charge_message
  end

  def protect(user)
    @defense = "true"

    protect_message
  end

  private

    def calculate_damage(cpu)
      damage = @power
      damage *= 0.8 if cpu.defense == "true"
      damage
    end
end