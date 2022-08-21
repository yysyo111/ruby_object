module MessageDialog
  # 攻撃時のメッセージ
  def attack_message(**params)
    attack_type = params[:attack_type]
    # 攻撃実行側のクラスのnameパラメータを使用して攻撃メッセージを表示
    puts "#{@name}の攻撃"
    puts "必殺攻撃" if attack_type == "special_attack"
  end

  # damage_messageの実装
  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts <<~EOS

    #{target.name}は#{damage}のダメージを受けた
    #{target.name}の残りHPは#{target.hp}だ

    EOS
  end

# end_messageを実装
  def end_message(result)
    if result[:brave_win_flag]
      puts <<~EOS

      勇者は勝った
      #{result[:exp]}の経験値と#{result[:gold]}のゴールドを手に入れた

      EOS
    else
      puts <<~EOS

      勇者はまけた
      目の前が真っ暗になった

      EOS
    end
  end

  # transform_messageを実装
  def transform_message(**params)
    origin_name = params[:origin_name]
    transform_name = params[:transform_name]

    puts <<~EOS

    #{origin_name}は怒っている
    #{origin_name}は#{transform_name}に変身した

    EOS
  end
end