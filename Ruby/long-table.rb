
# ① empty_seat変数: 座席という配列
# ② seats_count変数: 総座席数
# ③ number_of_visitors変数: 入店するグループの数
# ④ users変数: 来店した人数
# ⑤ seating_number変数: 来店したグループの着席開始番号
# ⑥ fill_last_number変数: 来店したグループの最後の人が着席した番号

# 下記のコードが何をしているかを説明してください・・・（A）= 8
seats_and_groups = gets.split(/\s/)

# 下記のコードが何をしているかを説明してください・・・（B）= 10
empty_seat = [*1..(seats_and_groups[0].to_i)]
# 下記のコードが何をしているかを説明してください・・・（C）= 13
seats_count = empty_seat.count
# 下記のコードが何をしているかを説明してください・・・（D）= 11
number_of_visitors = seats_and_groups[1].to_i

# 下記のコードが何をしているかを説明してください・・・（E）= 15
[*1..number_of_visitors].each do
  # 下記のコードが何をしているかを説明してください・・・（F）= 4
  used_seats = gets.split(/\s/)
  # 下記のコードが何をしているかを説明してください・・・（G）= 6
  users = used_seats[0].to_i
  # 下記のコードが何をしているかを説明してください・・・（H）= 12
  seating_number = used_seats[1].to_i

  # 下記のコードが何をしているかを説明してください・・・（I）= 9
  fill_last_number = ((seating_number + users) - 1)

  # 下記のコードが何をしているかを説明してください・・・（J）= 14
  if fill_last_number > seats_count
    # 下記のコードが何をしているかを説明してください・・・（K）= 3
    # （下記のコードは理解が難しいので、下記にヒントを載せます）

    # 「今回のグループが最後に着席する席の番号」 = 「今回のグループが最後に着席する席の番号」-「そもそもの座席の総数」となる（円卓だから）。
    # 例えば、fill_last_number == 13で、seats_countが12だったら、1 = 13 - 12となり、席番号が１の席に最後の人間が座る。
    fill_last_number = fill_last_number - seats_count
    # （下記のコードは理解が難しいので、下記にヒントを載せます）

    # next_seat_candidateは、「その席に既に人が座っていないか？」を判断するための配列
    # ([*1..seats_count] - empty_seat)は、（「全ての席」-　「まだ人が座っていない席」）の意味。つまり、「既に人が座っている席」の数字が、([*1..seats_count] - empty_seat)
    # [*seating_number..seats_count]は、[*「今回のグループが最初に着席する席の番号」..「最後の席の番号」]の意味
    # [*1..fill_last_number]は、[*「１（最初の席）」..「今回のグループが最後に着席する席の番号」]の意味
    # なので、next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..seats_count] + [*1..fill_last_number]は、
    # next_seat_candidate = 「既に人が座っている席」+ [*「今回のグループが最初に着席する席の番号」..「最後の席の番号」] + [*「１（最初の席）」..「今回のグループが最後に着席する席の番号」]となる。
    # つまり、 next_seat_candidateの配列の中に、同じ数字が含まれていれば、「既に埋まっている席に新たなグループの人間が座ろうとしている」ということになる
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..seats_count] + [*1..fill_last_number]
  else
    # 下記のコードが何をしているかを説明してください・・・（L）= 2
    # （下記のコードは理解が難しいので、下記にヒントを載せます）

    # next_seat_candidate = 「既に人が座っている席」+ [*「今回のグループが最初に着席する席の番号」..「今回のグループが最後に着席する席の番号」]となる
    # つまり、 next_seat_candidateの配列の中に、同じ数字が含まれていれば、「既に埋まっている席に新たなグループの人間が座ろうとしている」ということになる    
    next_seat_candidate = ([*1..seats_count] - empty_seat) + [*seating_number..fill_last_number]
  end

  # 下記のコードが何をしているかを説明してください・・・（M）= 5
  if next_seat_candidate.count == next_seat_candidate.uniq.count
    # 下記のコードが何をしているかを説明してください・・・（N）= 7
    if ((seating_number + users) - 1) > seats_count
      # 下記の二行のコードが何をしているかを説明してください・・・（O）= 1
      empty_seat = empty_seat - [*1..fill_last_number]
      empty_seat = empty_seat - [*seating_number..seats_count]
    else
      # 下記のコードが何をしているかを説明してください・・・（P）= 17
      empty_seat = empty_seat - [*seating_number..fill_last_number]
    end
  end
end

# 下記のコードが何をしているかを説明してください・・・（Q）= 16
puts seats_count - empty_seat.count
