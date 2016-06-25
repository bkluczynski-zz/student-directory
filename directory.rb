def input_students
  puts "Please enter the names of the students, a month of your cohort, your hobby and your country of birth. "
  puts "To finish, just hit return four times"
  #create an empty array
  students = []
  checking_typos = [:January, :February, :March, :April, :May,
  :June, :July, :August, :September, :October, :November, :December]

  name = gets.chomp
  cohort = gets.chomp.to_sym
  if !checking_typos.include?(cohort)
    puts "Please provide a valid cohort's name choosing from: "
    puts checking_typos
    cohort = gets.chomp
  end


  hobby = gets.chomp
  country = gets.chomp

  #while the name is not empty, repeat this code
  while !name.empty? || !cohort.empty? || !hobby.empty? || !country.empty?


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
students = input_students
print_header(students)
print(students)
print_footer(students)
