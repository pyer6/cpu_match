require './user'
require './cpu'
require './games_controller'

user = User.new(name: "サントス", hp: 200, power: 20)
cpu = Cpu.new(name: "CPU1", hp: 1000, power: 10)

games_controller = GamesController.new

games_controller.battle(user: user, cpu: cpu)