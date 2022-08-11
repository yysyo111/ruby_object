class Brave

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
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

brave = Brave.new(name: "テリー", hp: 500, offens: 150, defense: 100)

puts "NAME：#{brave.name}"
puts "HP：#{brave.hp}"
puts "OFFENSE：#{brave.offense}"
puts "DEFENSE：#{brave.defense}"