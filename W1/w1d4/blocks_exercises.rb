class Array

  # &prc method
  def my_each(&blk)
    i = 0 
    while i < self.count 
      blk.call(self[i])
      i += 1
    end
  end

  # yield
  def my_each2
    i = 0 
    while i < self.count 
      yield self[i]
      i += 1
    end
  end
  
  def my_map
    result = []    
    my_each {|el| result << yield(el)}
    result
  end
  
  def my_select
    result = []    
    my_each { |el| result << el if yield(el) == true}
    result
  end
  
  def my_inject
    copy = self.dup
    result = copy.shift 
    copy.my_each { |el| result = yield(result,el) }
    result 
  end
  
  def my_sort!(&blk)
    sorted = false
    until sorted
      sorted = true
      self.count.times do |index|
        next if (index + 1) == self.count
        if blk.call(self[index], self[index + 1]) == 1
          self[index], self[index + 1] = self[index + 1], self[index]
          sorted = false
        end
      end
    end
    self
  end

  def my_sort(&blk)
    self.dup.my_sort!(&blk)
  end
  
  def eval_block(*args, &blk)
    if blk.nil?
      puts "No block given"
    else
      blk.call(*args)
    end
  end
  
end


