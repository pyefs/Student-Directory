old_sync = $stdout.sync
$stdout.sync = true
require 'colorize'

puts "\r\n\r\n\r\n
Welcome to Guessing Game!
The game is simple.
I will choose a random number between 1-100.
Try to guess what that number is within 6 tries.
\r\n\r\nARE YOU IN?\r\n\r\n
Press ENTER to play, X to exit.\r\n\r\n"

choose = gets.chomp

if choose.upcase == "X"
  puts "it's okay! Come back when you're ready"
  exit
end
# difficulty_level = [1, 2, 3, 4]
diff_array = Array.[](rand(1..10), rand(1..20), rand(1..30), rand(1..50)) #random secret number by difficulty level
diff_range = Array.[](10, 20, 30, 50) #max range of difficulty by level
diff_chance = Array.[](3, 5, 8, 10) #number of chances by difficulty level

puts "Select difficulty. 1 = Easy, 2 = Medium, 3 = Hard, 4 = Extreme"

user_level = gets.chomp.to_i

until (1..4) === user_level
  puts "Difficulty level is from 1 to 4. Please try again."
  user_level = gets.chomp.to_i
end

puts "\r\n\r\nDifficulty Level: #{user_level}"

user_level = user_level - 1
my_number = diff_array.at(user_level)
guess_list = []
chance_left = diff_chance.at(user_level)

puts "You have #{chance_left} chances to guess and win.\r\nGood luck!\r\n\r\nLet's Begin"
puts "\r\n\r\n1st Try: My secret number is between 1 to #{diff_range.at(user_level)}"
puts "What is my secret number?"
# debug answer # puts "My secret number is " + "#{my_number}".colorize(:green) +"\r\n"

while chance_left <= diff_chance.at(user_level)
  if chance_left == 0
    puts "\r\nYou have used up all of your chances. You lose!"
    puts "My secret number is " + "#{my_number}".colorize(:green) +"\r\n"
    exit
  end
  current_guess = gets.chomp.to_i
  if current_guess == my_number
    puts "\r\nCongratulations!! You got it right!"
    exit
  else
    guess_list << current_guess
    puts "\r\nWrong answer. Please try again"
    puts "Chances remaining: #{chance_left - 1}"
    puts "Previous Guesses: " + "#{guess_list}".colorize(:yellow)
    chance_left -= 1
  end
  # game ends
end
