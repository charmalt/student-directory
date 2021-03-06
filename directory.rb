require'csv.rb'
@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students(request_filename)
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def input_students
  name = request_student_name # request first student name
  while !name.empty? do
    add_student_to_array(name)
    puts "There are currently #{@students.count} enrolled students."
    name = request_student_name
  end
end

def request_student_name
  print "Enter the names of the student or hit return twice to return:"
  STDIN.gets.chomp
end

def add_student_to_array(name)
  @students << {name: name, cohort: :november}
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  file = File.open(request_filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename)
  @students = []
  CSV.foreach(filename) do |line|
    name, cohort = line
    add_student_to_array(name)
  end
end

def request_filename
  puts "Enter file name:"
  gets.chomp
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
  puts ""
end

def try_load_students
  filename = "students.csv"# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# try_load_students
interactive_menu

# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :february, height: '5\'11', hobby: "eating"},
#   {name: "Darth Vader", cohort: :november, height: '5\'7', hobby: "pilates"},
#   {name: "Nurse Ratched", cohort: :april, height: '5\'1', hobby: "yoga"},
#   {name: "Michael Corleone", cohort: :november, height: '6\'4', hobby: "planning"},
#   {name: "Alex DeLarge", cohort: :february, height: '5\'2', hobby: "crossfit"},
#   {name: "The Wicked Witch of the West", cohort: :november,height: '6\'2', hobby: "meditation"},
#   {name: "Terminator", cohort: :april, height: '6\'7', hobby: "climbing"},
#   {name: "Freddy Krueger", cohort: :november, height: '5\'11', hobby: "skiing"},
#   {name: "The Joker", cohort: :november, height: '5\'11', hobby: "gaming"},
#   {name: "Joffrey Baratheon", cohort: :february, height: '5\'3', hobby: "knitting"},
#   {name: "Norman Bates", cohort: :november, height: '6\'3', hobby: "travelling"}
# ]

# def print_with_hobbies_height(students)
#   students.each_with_index do |student, index|
#     puts "#{(index+1).to_s.concat(".").ljust(3)} #{student[:name].ljust(30)} #{student[:height].ljust(5)} #{student[:hobby].ljust(10)} (#{student[:cohort]} cohort)"
#   end
# end
#
# def print_using_while(students)
#   count = 1
#   while count < students.length do
#     puts "#{count}. #{students[count][:name]} (#{students[count][:cohort]} cohort)"
#     count += 1
#   end
# end
#
# def print_by_first_letter(students, letter)
#   puts "Students starting with letter #{letter}: "
#   students.each do |student|
#     if student[:name].split("").first == letter
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

# def print_by_name_length(students, length)
#   puts "Students with name length shorter than #{length}: "
#   students.each do |student|
#     if student[:name].split("").count < length
#       puts "#{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

# def input_students_with_more_info
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#   # get the first name
#   name = gets.chomp
#   # while the name is not empty, repeat this code
#   while !name.empty? do
#     # add the student hash to the array
#     @students << {name: name, cohort: get_cohort, height: get_height, hobby: get_hobby}
#     if @students.count <= 1
#       puts "Now we have #{@students.count} student"
#     else
#       puts "Now we have #{@students.count} students"
#     end
#     # get another name from the user
#     name = gets.chomp
#   end
#   # return the array of students
#   @students
# end

# def get_cohort
#   cohort = ""
#   while (cohort!="november")&&(cohort!="february")&&(cohort!="april") do
#     puts "Please enter your cohort (november, february or april): "
#     cohort = gets.chomp!.downcase
#   end
#   return cohort.to_sym
# end
#
# def get_hobby
#   hobby = ""
#   puts "Please enter hobby: "
#   return gets.chomp!
# end
#
# def get_height
#   hobby = ""
#   puts "Please enter height: "
#   return gets.chomp!
# end
#
# def print_by_cohort(students)
#   cohorts = ["november", "february", "april"]
#   cohorts.each do |cohort|
#     puts "#{cohort.capitalize} Cohort"
#     students.each do |student|
#       if student[:cohort].to_s == cohort
#         puts "#{student[:name].ljust(30)} #{student[:height].ljust(5)} #{student[:hobby].ljust(10)}"
#       end
#     end
#   end
# end
