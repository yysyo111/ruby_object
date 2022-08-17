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

    # decision_attack_typeメソッドの呼び出し
    attack_type = decision_attack_type
    # calculate_damageメソッドの呼び出し キーワード引数を設定
    damege = calculate_damage(target: monster, attack_type: attack_type)
    # ダメージをHPに反映させる キーワード引数を設定
    cause_damage(target: monster, damege: damege)

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
    damege = params[:damege]
    target = params[:target]

    target.hp -= damege
    puts "#{target.name}は#{damege}のダメージを受けた"
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

    # 勇者に与えるダメージの計算
    damege = @offense - brave.defense
    # 勇者クラスのHPにダメージを反映
    brave.hp = damege

    puts "#{brave.name}は#{damege}のダメージを受けた"
    puts "#{brave.name}の残りのHPは#{brave.hp}だ"
  end

  # クラス外から呼び出せないようにする
  private
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

brave.attack(monster)
monster.attack(brave)
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
