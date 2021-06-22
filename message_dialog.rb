module MessageDialog
  def attack_message(**params)
    damage = params[:damage]
    opponent = params[:opponent]

    puts <<~TEXT

    #{@name}がアッタクを選択。
    #{@name}は#{opponent.name}に、#{damage}のダメージを与えた。
    #{opponent.name}の残りHPは#{opponent.hp}だ。

    TEXT
  end


  def charge_message

    puts <<~TEXT

    #{@name}はチャージを選択。
    攻撃力が上がった。

    TEXT

  end

  def protect_message
    
    puts <<~TEXT

    #{@name}がプロテクトを選択。
    #{@name}は防御態勢に入った。

    TEXT
  end
  
  def end_message(user)
    if user.hp > 0 
      puts "#{user.name}の勝利"
    else
      puts "#{user.name}の敗北"
    end
  end
end