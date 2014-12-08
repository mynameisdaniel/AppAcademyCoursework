# Jason Ebeung's solution

def make_change(amount, coins)
	return [1] * amount if coins.first == 1
	return [] if amount == 0 
    
	while coins.first > amount
		coins.shift
  end
  
  amount = amount - coins.first

	[coins.first] + make_change(amount, coins)
end

def make_change2(amount, coins)
	possibilities = [] 
	(0...coins.count).each do |x|
		possibilities << make_change(amount, coins.drop(x))
	end

  p possibilities
	possibilities.min_by{ |array| array.length }
end

p make_change2(14, [10, 7, 1])