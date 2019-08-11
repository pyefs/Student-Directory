old_sync = $stdout.sync
$stdout.sync = true

def get_input
	puts
	puts "Enter your name".center(45)
	puts
	@names = gets.chomp.downcase
	unless input_check(1) == true
		disp_msg(1)
		@names == gets.chomp.downcase
	end
	puts
	puts "Enter your age. E.g.: 21".center(45)
	puts
	@ages = gets.chomp
	unless input_check(2) == true
		disp_msg(2)
		@ages == gets.chomp
	end
	puts
	puts "Enter your gender. M = Male, F = Female".center(45)
	puts
	@gender = gets.chomp.downcase
	unless input_check(3) == true
		disp_msg(3)
		@gender == gets.chomp.downcase
	end
	update_dbase(@names, @ages, @gender)
end

def input_check(input)
	case input
	when 1 
		@names.match(/([0-9]|[[:punct:]]|\s)+/) === nil || @names.length > 1 ? true : false
	when 2 
		@ages.match(/([a-z]|[[:punct:]]|\s)+/) === nil || @ages != nil ? true : false
	when 3 
		!@gender.match(/(m|f)/) != true || @gender.length > 1 ? true : false
	end
end

def update_dbase(name, age, gender)
	student = "#{name.capitalize} #{age} #{gender.capitalize}\n"
	File.open("new.csv", "a") { |f| f.write student }
	disp_msg(4)
	main_menu
end

def student_list
	l = 0
	disp_msg(6)
	if File.readlines("new.csv").length == 0
		disp_msg(10)
	else
		File.readlines("new.csv").each do |i|
			l += 1
			n = i.downcase[/[A-z]+/,0]
			a = i[/[0-9][0-9]/,0]
			g = i[/(?![A-Z][a-z]+\s[0-9][0-9]\s)[A-Z]/,0]
			puts "##{l} »»  #{n.upcase}  «« Age: #{a}, Gender: #{g}".center(45)
		end
	end
end
def edit_entry
	# d = number of line - 1
	l = 0
	if File.readlines("new.csv").length == 0
		disp_msg(10)
	else 
		tmp = File.readlines("new.csv")
		File.new("new.csv", "w+")
		tmp.each do |i|
			if l != @d
				File.open("new.csv", "a") { |f| f.write i }
			end
			l += 1
		end
		get_input
		#disp_msg(7)
	end
	main_menu
end
def select_entry
	student_list
	disp_msg(5)
	@d = gets.chomp.to_i
	@d = @d - 1
	edit_entry
end
def disp_msg(msg)
	puts
	case msg
	when 1
		puts "ERROR. Name can't be blank or contain any spaces/digits/symbols.".center(45)
		puts "Enter your name. E.g.: castiel".center(45)

	when 2
		puts "ERROR. Age can't be blank or contain any spaces/alphabets/symbols.".center(45)
		puts "Enter your age. E.g.: 21".center(45)
	when 3
		puts "ERROR. Please select between M or F..center(45)"
		puts "Enter your gender. M = Male, F = Female".center(45)
	when 4
		puts "------------------------------------------------"
		puts
		puts "Adding new entry to the database..".center(45)
		puts
		puts "#{@names.capitalize} (#{@gender.capitalize}, #{@ages} years old)".center(45)
		puts
		sleep 0.5
		puts "Entry added!".center(45)
		puts
		puts "New student registration succesfull".center(45)
		puts
		sleep 0.5
	when 5
		puts "Enter the line number matching the entry you want to edit".center(45)
		puts "e.g. 1 to edit the first entry".center(45)
	when 6
		puts "------------------------------------------------"
		puts
		puts "Displaying Student List..".center(45)
		puts
		#sleep 0.5
	when 7
		puts "Student Directory Updated".center(45)
	when 8
		puts "Please select between 1-5 only".center(45)
	when 9
		puts "Students Directory Cleared!".center(45)
	when 10
		puts "Student Directory is Empty".center(45)
	when 11
		puts "------------------------------------------------"
		puts
		puts "WELCOME TO STUDENT DIRECTORY".center(45)
		puts
	when 12
		puts "------------------------------------------------"
		puts
		puts "Select an option (1-5):".center(45)
		puts
		puts "1. New Student Registration".center(45)
		puts "2. View Lists of Students".center(45)
		puts "3. Edit Student Entry".center(45)
		puts "4. Clear Students List".center(45)
		puts "5. Exit".center(45)
		puts
		puts "------------------------------------------------"
		puts
	end
end
def main_menu
	disp_msg(12)
	c = gets.chomp.to_i
	until (1..5) === c
		disp_msg(8)
		sleep 0.5
		disp_msg(12)
		c = gets.chomp.to_i
	end
	case c
	when 1 then	get_input
	when 2 
		student_list
		sleep 0.5
		main_menu
	when 3 then	select_entry
	when 4
		File.new("new.csv", "w+")
		disp_msg(9)
		main_menu
	when 5 
		exit
	end
end