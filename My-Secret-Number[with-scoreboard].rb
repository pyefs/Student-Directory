old_sync = $stdout.sync
$stdout.sync = true
@score_board = {}
@try_record = {}
@tries = 1
require 'colorize'

def player_name
	loop do
		puts "\r\n\r\nEnter your name"
		@siapa = gets.chomp.to_s
		puts "\r\n\r\nHello, #{@siapa}"
		break if @siapa.empty? == false
	end
end
def welcome_msg
	puts "\r\n\r\n\r\n
	Welcome to Guessing Game!
	The game is simple.
	I will choose a random number based on difficulty level.
	Try to guess what that number is.
	You have several chances each time.
	Chances are varied based on level of difficulties.
	ARE YOU IN?\r\n\r\n"
end
def select_to_play
	loop do
		puts "	Select 1 to play, 2 to exit.\r\n\r\n"
		@choose = gets.chomp.to_i
		break if (1..2) === @choose
	end
	exit if @choose == 2
end
def game_init
  	@diff_array = Array.[](rand(1..10), rand(1..20), rand(1..30), rand(1..50))
  	@diff_range = Array.[](10, 20, 30, 50) 
 	@diff_chance = Array.[](3, 5, 8, 10)
 	@guess_list = []
end
def select_difficulty
  	puts "\r\n\r\nSelect difficulty. 1 = Easy, 2 = Medium, 3 = Hard, 4 = Extreme"
  	@user_level = gets.chomp.to_i
  	until (1..4) === @user_level
  		puts "Difficulty level is from 1 to 4. Please try again."
  		@user_level = gets.chomp.to_i
  	end
  	puts "\r\n\r\nDifficulty Level: #{@user_level}"
  	@user_level = @user_level - 1
  	@my_number = @diff_array.at(@user_level)
  	@chance = @diff_chance.at(@user_level)
end
def game_start
  puts "\r\n\r\nYou have #{@chance} chances to guess and win.\r\nGood luck!\r\n\r\nLet's Begin"
  puts "\r\n\r\n1st Try: My secret number is between 1 to #{@diff_range.at(@user_level)}"
  puts "What is my secret number?"
  while @chance <= @diff_chance.at(@user_level)
   	if @chance == 0
      	puts "\r\nYou have used up all of your chances. You lose!"
	  	puts "My secret number is " + "#{@my_number}".colorize(:green) +"\r\n"
	   	break
    end
    current_guess = gets.chomp.to_i
    if current_guess == @my_number
      	puts "\r\nCongratulations!! You got it right!"
      	#user_record(@siapa, @tries)
      	@win = @score_board[@siapa]
      	@cuba = @try_record[@siapa]
      	@score_board[@siapa] = 1 + @win.to_i
      	@try_record[@siapa] = @cuba.to_i + @tries
      	break
    else
       	@guess_list << current_guess
       	puts "\r\nWrong answer. Please try again"
       	puts "Chances remaining: #{@chance - 1}"
      	puts "Previous Guesses: " + "#{@guess_list}".colorize(:yellow)
       	@chance -= 1
       	@tries += 1
   	end
  end
end
def scores
	@rank = 1
	puts "\r\n\r\nSCOREBOARD\r\n\r\n"
	@score_board.sort_by(&:last).each do |player, score|
		puts "----> ##{@rank} - #{player.colorize(:red)} - #{score} wins in #{@try_record[player]} tries.\r\n\r\n"
		@rank += 1
	end
end
welcome_msg
select_to_play
player_name
loop do 
	game_init
	select_difficulty
	game_start
	scores
	puts "Do you want to play again?\r\n\r\n"
	puts "1 - Hell yes! BRING IT ON!!\r\n\r\n"
	puts "2 - God no, I give up!!"
	@ans = gets.chomp.to_i
 	if @ans != 1
    	exit
 	end
end
#play_again