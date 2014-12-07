class Array
  
  def my_uniq
    new_array = []
    self.each do |el|
      next if new_array.include?(el)
      new_array.push(el)  
    end
    new_array
  end

  def two_sum
    new_array = []
    (0..(self.length - 1)).each do |i|
      (i+1..(self.length - 1)).each do |j|
        new_array.push([i, j]) if array[i] + array[j] == 0
      end
    end
    new_array
  end
end

def tower_of_hanoi
  towers = Array.new(3) { Array.new }
  num_disks = 3
  num_disks.downto(1) {|i| towers[0].push(i)}
  
  loop do
    p "tower 1 contains #{towers[0]}"
    p "tower 2 contains #{towers[1]}"
    p "tower 3 contains #{towers[2]}"
    
    p "Which tower to move disc from?"
    
    from_tower = gets.to_i - 1
    
    if towers[from_tower].empty?
      p "Tower is empty"
      break
    end 

    p "Which tower to move to?"
    to_tower = gets.to_i - 1
    
    if towers[to_tower].length == 0 || 
      towers[from_tower].last < towers[to_tower].last
      towers[to_tower].push(towers[from_tower].pop)      
    else
      print "Invalid Move \n"

    end

    if towers[1]==[3,2,1] || towers[2]==[3,2,1]
      print "You Win!"
      break
    end
  end
end

def my_transpose(array)
  transposed_array = Array.new(array[0].count) {Array.new}
  array.each do |row|
    i = 0
    row.each do |value|
      transposed_array[i].push(value)
      i += 1
    end
  end
  transposed_array
end

def stock_picker(array)
  best_profit = 0
  best_days = []
  
  (0..(array.length - 1)).each do |i|
    (i+1..(array.length -1)).each do |j|
      profit = array[j]-array[i]
      if profit > best_profit
        best_profit = profit
        best_days = [i+1,j+1s]
      end
    end
  end
  best_days
end