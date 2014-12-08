def make_change(amount, coins = [25,10,5,1])
  
  sets = []
  @combos = []

  def helper(amount, index, coins, sequence)
    helper(amount , index+1, coins, sequence) if index+1 < coins.count  
    if amount - coins[index] > 0
      new_set = sequence.dup
      new_set << coins[index]
      helper(amount-coins[index], index, coins, new_set)
    elsif coins[index] == amount
      sequence << coins[index]
      @combos << sequence 
    end
  end

  helper(amount, 0, coins, sets)
  return @combos

end