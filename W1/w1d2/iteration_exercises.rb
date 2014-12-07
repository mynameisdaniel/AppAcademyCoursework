def factors(num)
  (1..num).to_a.select do |el|
    num % el == 0
  end
end

def bubble_sort(array)
  sorted = false
  until sorted
    sorted = true
    (array.count - 1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        sorted = false
      end
    end
  end
  array
end

def substrings(string)
  strings = []
  (0..string.length-1).each do |i|
    (i..string.length-1).each do |j|
      strings << string[i..j] unless strings.include?(string[i..j])
   end
  end
  strings
end

def subwords(string)
  dictionary  = []
  words = []
  File.open("dictionary.txt").each do |line|
    dictionary.push(line.chomp)
  end
  substrings(string).each do |word|
    words << word if dictionary.include?(word)
  end
  words
end