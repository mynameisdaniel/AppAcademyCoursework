def rps(move)
  rps_win = { "Paper" => "Rock", "Rock" => "Scissors", "Scissors" => "Paper" }
  cpu_move = eval_win.keys[rand(3)]
  if eval_win[move] == cpu_move
    outcome = "Win"
  elsif move != cpu_move
    outcome = "Lose"
  else
    outcome = "Draw"
  end
  [cpu_move, outcome].join(", ")
end 

def remix(array)
  drinks = array.dup
  alcohol = []
  mixer = []
  new_drinks = []

  array.each do |pair| 
    pair.each_with_index do |val, index|
     if index == 0
       alcohol << val
     else
        mixer << val
      end
    end
  end
  
  def make_drink
    alcohol.shuffle!
    mixer.shuffle!
    new_drinks << [alcohol.shift, mixer.shift]
    remove if drinks.include?(new_drink.last)
  end

  def remove
    alcohol << new_drinks.last[0]
    mixer << new_drinks.last[1]
    new_drinks.delete(new_drinks.last)
  end

  while alcohol.count != 0
    make_drink
    remove if new_drinks.count == 2 && array.include?([alcohol.last, mixer.last])
  end
  new_drinks
end