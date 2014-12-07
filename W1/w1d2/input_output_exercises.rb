def guess
  computer_guess = rand(100)
  guesses = []
  
  while guesses.last != computer_guess
    p "Guess what my number is?"
    input = gets.chomp.to_i
    guesses << input
    if input < computer_guess
      puts "Your guess is too low!"
    elsif input == computer_guess
      puts "Bingo! You're right on the money."
    else
      puts "Your guess is too high!"
    end
  end
end


def file_shuffle
  puts "Input file name"
  file_name = gets.chomp
  file_type = ".txt"
  file_add = "-shuffled"

  array = []
  File.open(file_name + file_type).each do |line|
    array.push(line.chomp)
  end
  array.shuffle!
  File.open(file_name + file_add + file_type, "w") do |f|
    f.puts array.join("\n")
  end
end