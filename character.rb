class Character
  require './message_dialog'

  attr_accessor :hp, :defense, :power
  attr_reader :name

  include MessageDialog

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @power = params[:power]

    @defense = "false"
    @standard_power = params[:power]
  end
end
