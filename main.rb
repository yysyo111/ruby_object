class Brave

  def initialize
    @name = "テリー"
    @hp = 500
    @offense = 150
    @defense = 100
  end

  # nameのゲッター
  def name
    @name
  end

   # hpのゲッター
  def hp
    @hp
  end

  # offenseのゲッター
  def offense
    @offense
  end

   # defenseのゲッター
  def defense
    @defense
  end
end

brave = Brave.new

puts "NAME：#{brave.name}"
puts "HP：#{brave.hp}"
puts "OFFENSE：#{brave.offense}"
puts "DEFENSE：#{brave.defense}"