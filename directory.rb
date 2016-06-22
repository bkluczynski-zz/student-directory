def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return four times"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  puts "Please enter a month of your cohort"
  cohort = gets.chomp
  #checking for typos
  #making an array containing all month
  puts "Please enter your hobby"
  hobby = gets.chomp
  puts "Please enter your country"
  country = gets.chomp


  #while the name is not empty, repeat this code
  while !name.empty? || !cohort.empty? || !hobby.empty? || !country.empty?
  # add the student hash to the array
  if cohort.empty? == true
  cohort = "N/A"
  end

  if hobby.empty? == true
  hobby = "N/A"
  end

  if country.empty? == true
  country = "N/A"
  end

  students << {name: name, cohort: cohort, hobby: hobby, country: country}
  puts "Now we have #{students.count} students"
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

def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print(students)

index = 0

#while students.length > index

students.map do |group|


    if group[:cohort] == "march"


  puts "#{index+1}.#{students[index][:name]}".ljust(10) << " - ".center(10) << "Cohort :".ljust(10) +
  "#{students[index][:cohort]}".ljust(10) + "||".center(10) + "Hobby :".ljust(10) + "#{students[index][:hobby]}".ljust(10) +
  "||".center(10) + "Country :".ljust(10) + " #{students[index][:country]}".ljust(10)

    end
index += 1

end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
