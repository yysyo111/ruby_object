require './character'

class Monster < Character
  POWER_UP_RATE = 1.5
  # HPの半分の値を計算する定数
  CALC_HALF_HP = 0.5

  def initialize(**params)
    super(
      name: params[:name],
      hp: params[:hp],
      offense: params[:offense],
      defense: params[:defense]
    )
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

    # puts "#{@name}の攻撃"

     # ダメージ計算処理の呼び出し
    damage = calculate_damage(brave)

    # ダメージ反映処理の呼び出し
    cause_damage(target: brave, damage: damage)

    # attack_messageの呼び出し
    attack_message
    # damage_messageを呼び出す
    damage_message(target: brave, damage: damage)
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

    # puts "#{target.name}は#{damage}のダメージを受けた"
  end

  # 変身メソッド
  def transform
    # 変身後の名前
    transform_name = "ドラゴン"

    # transform_messageを呼び出し
    transform_message(origin_name: @name, transform_name: transform_name)

    # モンスターの攻撃力を1.5倍にする
    @offense = @offense * POWER_UP_RATE

    @name = transform_name
  end
end