class Player
  
  def hand
    while true do
    puts "数字を入力してください。"
    puts "0: グー"
    puts "1: チョキ"
    puts "2: パー"
    player_hand = gets.chomp
    # p player_hand
      if player_hand == "0"
        player_hand = 0
        break
      elsif player_hand == "1"
        player_hand =1
        break
      elsif player_hand == "2"
        player_hand = 2
        break
      end
    end
    return player_hand
  end

end

class Enemy
  def hand
    enemy_hand = rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    if player_hand == 0
      p_hand ="グー"
    elsif player_hand == 1
      p_hand = "チョキ"
    elsif player_hand == 2
      p_hand = "パー"
    end

    if enemy_hand == 0
      e_hand ="グー"
    elsif enemy_hand == 1
      e_hand = "チョキ"
    elsif enemy_hand == 2
      e_hand = "パー"
    end
    
    puts "私は#{p_hand}を出しました"
    puts "相手は#{e_hand}を出しました"

    if (player_hand - enemy_hand + 3) % 3 ==2
      puts "勝ち"
      elsif (player_hand - enemy_hand + 3) % 3 == 1
        puts "敗け"
      elsif (player_hand - enemy_hand + 3) % 3 == 0
        puts "あいこ"
        while true do
          puts "数字を入力してください。"
          puts "0: グー"
          puts "1: チョキ"
          puts "2: パー"
          player_hand = gets.chomp
          # p player_hand
            if player_hand == "0"
              player_hand = 0
              break
            elsif player_hand == "1"
              player_hand =1
              break
            elsif player_hand == "2"
              player_hand = 2
              break
            end
        end
          player_hand
          enemy_hand = rand(0..2)
          pon(player_hand, enemy_hand)
    end
  end

end

player = Player.new
enemy = Enemy.new
janken = Janken.new

janken.pon(player.hand, enemy.hand)
