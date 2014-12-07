#count_change.rb
# 1. contain everything in one method
# initiating and pushing to arrays 



def make_change(amount, coins = [25,10,5,1])
  sets = []
  @combos = []
  def helper(amount, index, coins, sequence)
    print "Reamaining amount: #{amount}, #{index}, #{coins}, #{sequence}"
    print "\n"

    helper(amount , index+1, coins, sequence) if index+1 < coins.count  # same amount with smaller coin

    if amount - coins[index] > 0 # there is still change left
      new_set = sequence.dup
      new_set << coins[index]
      helper(amount-coins[index], index, coins, new_set) # new amount with same coin
    elsif coins[index] == amount # exact change 
      sequence << coins[index]
      print "\n"
      @combos << sequence 
    end
  end

    helper(amount, 0, coins, sets)
    return @combos

end

a = make_change(25, coins = [10, 5, 1])

print a
