def num_to_s(num, base)
  key_vals = {0=>'0',1=>'1',2=>'2',3=>'3',4=>'4',5=>'5',6=>'6',7=>'7',8=>'8',
    9=>'9',10=>'A',11=>'B',12=>'C',13=>'D',14=>'E',15=>'F'}
  exponent = 0
  output = ""
  until base**exponent > num
    output += key_vals[((num/(base**exponent))%base)]
    exponent += 1
  end
  output.reverse
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
  output.join("")
end