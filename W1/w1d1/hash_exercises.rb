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