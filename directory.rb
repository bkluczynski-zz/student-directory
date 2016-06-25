@students = []

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end




def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students, a month of your cohort, your hobby and your country of birth. "
  puts "To finish, just hit return four times"
  #create an empty array
  checking_typos = ["january", "february", "march", "april", "may",
  "june", "july", "august", "september", "october", "november", "december"]
  name = gets.chomp
  cohort = gets.chomp
  hobby = gets.chomp
  country = gets.chomp

  #while the name is not empty, repeat this code
    while !name.empty? || !cohort.empty? || !hobby.empty? || !country.empty?
      if !checking_typos.include?(cohort.downcase)
      puts "Please provide a valid cohort's name choosing from: "
      puts checking_typos
      cohort = gets.chomp.capitalize!
      end

        @students << {name: name, cohort: cohort, hobby: hobby, country: country}

        print_footer
        # get another name from the user
        puts "Please enter another name of the student or hit return four times to exit"
        name = gets.chomp

        puts "Please enter your cohort"
        cohort = gets.chomp

        puts "Please enter your hobby"
        hobby = gets.chomp

        puts "Please enter your country"
        country = gets.chomp



    end
end

def print_header
  puts "The students of Villains Academy"
  puts "----------"

end

def print_students_list
  index = 0

  while @students.length > index

    puts "#{index+1}.#{@students[index][:name]}".ljust(10) << " - ".center(10) << "Cohort :".ljust(10) +
    "#{@students[index][:cohort]}".ljust(10) + "||".center(10) + "Hobby :".ljust(10) + "#{@students[index][:hobby]}".ljust(10) +
    "||".center(10) + "Country :".ljust(10) + " #{@students[index][:country]}".ljust(10)

    index += 1
  end
end


def print_footer

  if "#{@students.count}.".to_i > 1
    puts "Overall, we have #{@students.count} great students"
  elsif "#{@students.count}".to_i == 0
    puts "There is no students in this academy"
  else
    puts "Overall, we have #{@students.count} great student"
  end

end
#nothing happens until we call the methods

interactive_menu
