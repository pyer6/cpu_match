require './character'

class User < Character
  def attack(cpu)
    damage = calculate_damage(cpu)
    cpu.hp -= damage
    cpu.hp = 0 if cpu.hp < 0

    attack_message(damage: damage, opponent: cpu)

    @power = @standard_power if @power != @standard_power
  end

  def charge(cpu)
    @power *= 2.5

    charge_message
  end

  def protect(cpu)
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