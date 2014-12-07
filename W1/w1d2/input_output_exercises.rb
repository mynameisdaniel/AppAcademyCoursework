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
  