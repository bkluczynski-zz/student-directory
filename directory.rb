

def interactive_menu
  students = []

  loop do

      # 1. print the menu and ask the user what to do
      puts "1. Input the students"
      puts "2. Show the students"
      puts "9. Exit"
      # 2. read the input and save it to a variable
      selection = gets.chomp
      # 3. do what the user has asked
      case selection
        when "1"
          students = input_students
        when "2"
          print_header(students)
          print(students)
          print_footer(students)
        when "9"
          exit
        else
          puts "I don't know what you mean, try again"
      end





  end

end







def input_students
  puts "Please enter the names of the students, a month of your cohort, your hobby and your country of birth. "
  puts "To finish, just hit return four times"
  #create an empty array
  checking_typos = [:January, :February, :March, :April, :May,
  :June, :July, :August, :September, :October, :November, :December]
  students = []

  name = gets.chomp
  cohort = gets.chomp.to_sym


  hobby = gets.chomp
  country = gets.chomp

  #while the name is not empty, repeat this code
  while !name.empty? || !cohort.empty? || !hobby.empty? || !country.empty?
    if !checking_typos.include?(cohort)
      puts "Please provide a valid cohort's name choosing from: "
      puts checking_typos
      cohort = gets.chomp
    end

  students << {name: name, cohort: cohort, hobby: hobby, country: country}

  print_footer(students)
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


#return the array of students
students

end

def print_header(names)

  if "#{names.count}".to_i == 0
  puts ""
  else
  puts "The students of Villains Academy"
  puts "----------"
  end
end

def print(students)

index = 0

  while students.length > index

    puts "#{index+1}.#{students[index][:name]}".ljust(10) << " - ".center(10) << "Cohort :".ljust(10) +
  "#{students[index][:cohort]}".ljust(10) + "||".center(10) + "Hobby :".ljust(10) + "#{students[index][:hobby]}".ljust(10) +
  "||".center(10) + "Country :".ljust(10) + " #{students[index][:country]}".ljust(10)


index += 1
end
end


def print_footer(names)

  if "#{names.count}.".to_i > 1
    puts "Overall, we have #{names.count} great students"
  elsif "#{names.count}".to_i == 0
    puts "There is no students in this academy"
  else
    puts "Overall, we have #{names.count} great student"
  end

end
#nothing happens until we call the methods

interactive_menu
