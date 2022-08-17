class Brave
  # attr_readerの記述でゲッターを省略することができる
  # attr_reader :name
  # attr_reader :hp
  # attr_reader :offense
  # attr_reader :defense
  attr_reader :name, :offense, :defense

  attr_accessor :hp

  # 必殺攻撃の計算に使う定数
  SPECIAL_ATTACK_CONSTANT = 1.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  # 攻撃処理を実装するメソッド
  def attack(monster)
    puts "#{@name}の攻撃"

    attack_num = rand(4)

    if attack_num == 0
       # 必殺攻撃の表示
      puts "必殺攻撃"
      # calculate_special_attackの呼び出し
      # 攻撃力の1.5倍の数値が戻り値として返ってくる
      damege = calculate_special_attack - monster.defense
    else
      # 通常攻撃の表示
      puts "通常攻撃"
      damege = @offense - monster.defense
    end

    monster.hp = monster.hp - damege
    # monster.hp -= damage

    puts "#{monster.name}は#{damege}のダメージを受けた"
    puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end

  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end

  # # セッター再定義
  # def hp=(hp)
  #   @hp = hp
  # end

end


class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

end

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

brave.attack(monster)
# puts "NAME：#{brave.name}"
# puts "HP：#{brave.hp}"
# puts "OFFENSE：#{brave.offense}"
# puts "DEFENSE：#{brave.defense}"

# 上記と同じ
# puts <<~TEXT
# NAME：#{brave.name}
# HP：#{brave.hp}
# OFFENSE：#{brave.offense}
# DEFENSE：#{brave.defense}
# TEXT

# brave.hp -= 30

# puts "#{brave.name}はダメージを受けた!残りHPは#{brave.hp}だ"
