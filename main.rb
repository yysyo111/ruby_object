class Brave
  # attr_readerの記述でゲッターを省略することができる
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

    # decision_attack_typeメソッドの呼び出し
    attack_type = decision_attack_type
    # calculate_damageメソッドの呼び出し キーワード引数を設定
    damage = calculate_damage(target: monster, attack_type: attack_type)
    # ダメージをHPに反映させる キーワード引数を設定
    cause_damage(target: monster, damage: damage)

    puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end


  private
  # 攻撃の種類（通常攻撃 or 必殺攻撃）を判定するメソッド
  def decision_attack_type
    attack_num = rand(4)

    if attack_num == 0
      puts "必殺攻撃"
      "special_attack"
    else
      puts "通常攻撃"
      "nomal_attack"
    end
  end

  # ダメージの計算メソッド  **paramsで受け取る
  def calculate_damage(**params)
    # 変数に格納することによって将来ハッシュのキーに変更があった場合でも変更箇所が少なくて済む
    target = params[:target]
    attack_type = params[:attack_type]

    if attack_type == "special_attack"
      calculate_special_attack - target.defense
    else
      @offense - target.defense
    end
  end

   # HPにダメージを反映させる
  def cause_damage(**params)
     # 変数に格納することによって将来ハッシュのキーに変更があった場合でも変更箇所が少なくて済む
    damage = params[:damage]
    target = params[:target]

    target.hp -= damage
    # もしターゲットのHPがマイナスになるなら0を代入
    target.hp = 0 if target.hp < 0

    puts "#{target.name}は#{damage}のダメージを受けた"
  end

  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end

end


class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  POWER_UP_RATE = 1.5
  # HPの半分の値を計算する定数
  CALC_HALF_HP = 0.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]

    # モンスターが変身したかどうかを判定するフラグ
    @transform_flag = false

    # 変身する際の閾値（トリガー）を計算
    @trigger_of_transform = params[:hp] * CALC_HALF_HP
  end

  def attack(brave)
    # HPが半分以下、かつ、モンスター変身判定フラグがfalseの時に実行
    if @hp <= @trigger_of_transform && @transform_flag == false
      # モンスター変身判定フラグにtrueを代入
      @transform_flag = true
      # 変身メソッドを実行
      transform
    end

    puts "#{@name}の攻撃"

     # ダメージ計算処理の呼び出し
    damage = calculate_damage(brave)

    # ダメージ反映処理の呼び出し
    cause_damage(target: brave, damage: damage)

    puts "#{brave.name}は#{damage}のダメージを受けた"
    puts "#{brave.name}の残りのHPは#{brave.hp}だ"
  end

  # クラス外から呼び出せないようにする
  private
  # ダメージ計算処理
  def calculate_damage(target)
    @offense - target.defense
  end

  # ダメージ反映処理
  def cause_damage(**params)
    # 引数で受け取った値を変数に格納
    damage = params[:damage]
    target = params[:target]

    target.hp -= damage

    # もしターゲットのHPがマイナスになるなら0を代入
    target.hp = 0 if target.hp < 0

    puts "#{target.name}は#{damage}のダメージを受けた"
  end

  # 変身メソッド
  def transform
    # 変身後の名前
    transform_name = "ドラゴン"

    # 変身メッセージ ヒアドキュメント
    puts <<~EOS
    #{@name}は怒っている
    #{@name}は#{transform_name}に変身した
    EOS
    # puts "#{@name}は怒っている#{@name}は#{transform_name}に変身した"

    # モンスターの攻撃力を1.5倍にする
    @offense = @offense * POWER_UP_RATE

    @name = transform_name
  end
end

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

monster = Monster.new(name: "スライム", hp: 200, offense: 200, defense: 100)

loop do
  brave.attack(monster)
  if monster.hp <= 0
    exp = (monster.offense + monster.defense) * 2
    gold = (monster.offense + monster.defense) * 3
    puts "#{brave.name}はたたかいに勝った"
    puts "#{exp}の経験値と#{gold}ゴールドを獲得した"
    break
  end

  monster.attack(brave)
  if brave.hp <= 0
    puts "#{brave.name}はたたかいに負けた"
    puts "目の前が真っ暗になった"
    break
  end
end