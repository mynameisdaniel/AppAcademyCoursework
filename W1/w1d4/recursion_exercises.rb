def range_iter(start, stop)
  range = []
  i = start + 1
  while i < stop
    range << i
    i += 1
  end
  range
end

#capturing numbers between start and stop recursively

def range(start, stop)
  return [start + 1] if stop - start == 2
  range(start,stop-1) + [stop - 1]
end

def exp(base, exponent)
    return 1 if exponent == 0
    base * exp(base, exponent - 1)
end

def exp2(base, exponent)
    return 1 if exponent == 0
    return base if exponent == 1
    return exp(base, exponent/2) * exp(base, exponent/2) if exponent % 2 == 0
    base * ( (exp(base, (exponent - 1) / 2 ) * (exp(base, (exponent - 1) / 2 ) )))
end

class Array
  
  def deep_dup_iter
    result  = []
    self.each do |el|
      if el.is_a?(Array)
        result << el.dup
      else
        result << el
      end
    end
    result
  end
  
  def deep_dup
    result  = []
    self.each do |el|
      if el.is_a?(Array)
        result << el.deep_dup
      else
        result << el
      end
    end
    result
  end
end


def binary_search(array, target)
  return nil if array.count == 0

  middle =  (array.count / 2)
  if array[middle] == target
    return middle
  elsif
    array[middle] < target
    return middle + binary_search(array[middle..-1], target)
  else
    return middle - binary_search(array[0...middle], target) 
  end 
end


def fibs_recursive(n)
  return [0] if n == 1
  return [0, 1] if n == 2 
  prev_fibs = fibs_recursive(n - 1)
  prev_fibs + [prev_fibs[-1] + prev_fibs[-2]]
end

def fibs_iter(n)
  fib_terms = []
  fib1, fib2 = 0, 1
  i = 0
  while i < n
    fib_terms << fib1
    fib1, fib2 = fib2, fib1+fib2
    i += 1
  end
  fib_terms
end

class Array
  def merge_sort
    return self if self.count <= 1
    middle = self.count / 2
    left = self[0...middle].merge_sort
    right = self[middle..-1].merge_sort
    merge(left,right)
  end

  def merge(array1, array2)
    array3 = []
    until array1.empty? && array2.empty?
      if array1.empty?
        array3 << array2.shift 
      elsif array2.empty?
        array3 << array1.shift 
      elsif array1.first <= array2.first
        array3 << array1.shift
      else
        array3 << array2.shift
      end
    end
    array3
  end
end