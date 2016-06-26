@students = [] # an empty array accessible to all methods
require 'csv'
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to..."
  puts "4. Load the list from..."
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "You have selected to input the students"
    input_students
  when "2"
    puts "You have selected to show the students"
    show_students
  when "3"
    puts "What name would you like to give to your file or where would you like to save data?"
    @input_saving = STDIN.gets.chomp
    save_students
  when "4"
    puts "Where would you like to load the data from?"
    @input_loading = STDIN.gets.chomp
    load_students
  when "9"
    puts "You exited the program succesfully"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

require 'readline'

def ask_for_input(prompt="", newline=false)
    prompt += "\n" if newline
    Readline.readline(prompt, false).squeeze(" ").strip
end


def input_students

  name = ask_for_input "Please enter the names of the student and
  their respective cohort. To finish just hit return twice. "
  cohort = ask_for_input
  # get the first name
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    adding_students(name, cohort)
    count_students
    # get another name from the user
    name = ask_for_input "Please enter name of the next student. "
    cohort = ask_for_input "And his/her cohort. "
  end
end



def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def show_students
  print_header
  print_student_list
  count_students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def count_students
@students.count == 1 ? (puts "We have #{@students.count} student") : (puts "We have #{@students.count} students")
end

def save_students(filnename = "students.csv")
  #open the file for writing
    CSV.open(@input_saving, "wb") do |csv|
#iterate over the array of students
      @students.each do |student|
      csv << [student[:name],student[:cohort]]
      end
    end
    puts "Saving completed!"
end

def load_students(filename = "students.csv")
  if File.exist?(@input_loading)
    CSV.foreach(@input_loading, "r") do |row|
    adding_students(row[0], row[1])
  end
  puts "Loading completed!"
  else
  puts "I am sorry, but #{@input_loading} does not exist. Try again"
  end

end


def adding_students(name, cohort)
  @students << {name: name, cohort: cohort}
end

def try_load_students(filename = "students.csv")
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
      if File.exists?(filename) #if it exists
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
      else
        puts "Sorry, #{filname} doesn't exist."
        exit
      end
end

try_load_students
interactive_menu
