def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
  students << {name: name, cohort: :november, hobby: :snarkling, country: :Poland}
  puts "Now we have #{students.count} students"
  # get another name from the user
  name = gets.chomp
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

while students.length > index

  puts "#{index + 1}.#{students[index][:name]}".ljust(20) << " - ".center(10) << "Cohort : #{students[index][:cohort]}".rjust(20) + "||".center(10) + "Hobby : #{students[index][:hobby]}".center(20) +
  "||".center(10) + "Country : #{students[index][:country]}".center(20)

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
