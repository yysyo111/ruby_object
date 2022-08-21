require './character'

class Brave < Character
  # 必殺攻撃の計算に使う定数
  SPECIAL_ATTACK_CONSTANT = 1.5

  # 攻撃処理を実装するメソッド
  def attack(monster)
    # puts "#{@name}の攻撃"

    # decision_attack_typeメソッドの呼び出し
    attack_type = decision_attack_type
    # calculate_damageメソッドの呼び出し キーワード引数を設定
    damage = calculate_damage(target: monster, attack_type: attack_type)
    # ダメージをHPに反映させる キーワード引数を設定
    cause_damage(target: monster, damage: damage)

    # attack_messageの呼び出し
    attack_message(attack_type: attack_type)
    # damage_messageを呼び出す
    damage_message(target: monster, damage: damage)
  end


  private
  # 攻撃の種類（通常攻撃 or 必殺攻撃）を判定するメソッド
  def decision_attack_type
    attack_num = rand(4)

    if attack_num == 0
      # puts "必殺攻撃"
      "special_attack"
    else
      # puts "通常攻撃"
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

    # puts "#{target.name}は#{damage}のダメージを受けた"
  end

  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end

end