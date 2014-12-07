class Array
  
  def my_uniq
    #uniq_array = []
    new_array = []
    self.each do |value|
      next if new_array.include?(value)
      new_array.push(value)  

      #new_array << value unless new_array.include?(value)
    end
    new_array
  end

  def two_sum

    #pairs = []
    new_array = []

    #array.count.times do |i1|
      #(i1 + 1).upto(array.count -1) do |i2|
        #pairs << [i1, ,i2| if array[i1] +array[i2] == 0
      #end
    #end

    (0..(self.length - 1)).each do |i|
      (0..(self.length - 1)).each do |j|
        if j <= i
          next
        elsif array[i] + array[j] == 0
          new_array.push([i, j])
        end
      end
    end
    new_array
  end
end

def tower_of_hanoi
  towers = Array.new(3, [])
  init_size = 3
  towers[0] = *(1..init_size)

  #towers = Array.new(3, Array.new)
  
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
      towers[from_tower].last > towers[to_tower].last
      towers[to_tower].push(towers[from_tower].pop)      
    else
      print "Cannot move on top of a smaller disk"

    end

    if towers[1]==[1,2,3] || towers[2]==[1,2,3]
      print "Success"
      break
    end
  end
end

def my_transpose(array)
  transposed_array = Array.new(array[0].count, [])

  array.each do |row|
    i = 0
    row.each do |value|
      p value
      transposed_array[i].push(value)
      i+=1
    end
  end
  
  transposed_array
end

def stock_picker(array)
  best_profit = 0
  best_days = []
  
  array.each_index do |i|
    array.each_index do |j|
      if j > i 

        profit = array[j]-array[i]
        if profit > best_profit
          best_profit = profit
          best_days = [i+1,j+1s]
        end
      end
    end
  end
  best_days
end
   
   
def num_to_s(num, base)
  key_vals = {0=>'0',1=>'1',2=>'2',3=>'3',4=>'4',5=>'5',6=>'6',7=>'7',8=>'8',
    9=>'9',10=>'A',11=>'B',12=>'C',13=>'D',14=>'E',15=>'F'}
  power = 0
  output = ""
  until base**power > num
    output += key_vals[((num/(base**power))%base)]
    power+=1
  end

  return output.reverse
end

def caesar(string, num)
  alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  letters = string.split("")
  output = []
  letters.each do |letter|
    index_number = alphabet.find_index(letter) + num
    
    if index_number > 25
        output.push(alphabet[index_number-26])
      else
        output.push(alphabet[index_number])
      end
    end
    
    return output.join("")
end

class MyHashSet
  
  def initialize
    @store = {}
  end
  
  def insert(el)
    @store[el] = true
  end
  
  def include?(el)
    @store.has_key?(el) 
  end
  
  def delete(el)
      return false unless self.include?(el)
      @store.delete(el)
      true
      end
  end
  
  def to_a
    @store.keys
  end
  
  def union(set2)
    new_set = MyHashSet.new
    
    self.to_a.each do |key|
      if new_set.include?(key)==false
        new_set.insert(key)
      end
    end
    
    set2.to_a.each do |key|
      if new_set.include?(key)==false
        new_set.insert(key)
      end
    end
      
    new_set
  end
  
  def intersect(set2)
    new_set = MyHashSet.new
     
    self.to_a.each do |key|
      if set2.include?(key)
        new_set.insert(key) 
      end
    end
    
    new_set
  end
  
  
  def minus(set2)
    new_set = MyHashSet.new
    
    self.to_a.each do |key|
       if set2.include?(key) == false
         new_set.insert(key)
       end
    end
    new_set
    
  end  
end


def double_array(array)
  array.map { |i| i*2 }
end

class Array
  
  def my_each
   i = 0
   while i < self.length 
      yield self[i]
     i += 1
   end
    return self
  end
end

def median(array)
  
  med_array=array.sort
  idx=med_array.length/2
  if med_array.length.odd? 
    return med_array[idx]
  else
    return ((med_array[idx]+med_array[idx - 1]) / 2.0)
  end
end

def concatenate(array)
  array.inject("") do |accum,element|
    accum+=element
  end
end    
