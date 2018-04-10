def interactive_menu
  students = []
  student_count = 0
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students(students)
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

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

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_with_hobbies_height(students)
  students.each_with_index do |student, index|
    puts "#{(index+1).to_s.concat(".").ljust(3)} #{student[:name].ljust(30)} #{student[:height].ljust(5)} #{student[:hobby].ljust(10)} (#{student[:cohort]} cohort)"
  end
end

def print_using_while(students)
  count = 1
  while count < students.length do
    puts "#{count}. #{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count += 1
  end
end

def print_by_first_letter(students, letter)
  puts "Students starting with letter #{letter}: "
  students.each do |student|
    if student[:name].split("").first == letter
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_by_name_length(students, length)
  puts "Students with name length shorter than #{length}: "
  students.each do |student|
    if student[:name].split("").count < length
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
  puts ""
end

def input_students(students)
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: get_cohort, height: get_height, hobby: get_hobby}
    if students.count <= 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def get_cohort
  cohort = ""
  while (cohort!="november")&&(cohort!="february")&&(cohort!="april") do
    puts "Please enter your cohort (november, february or april): "
    cohort = gets.chomp!.downcase
  end
  return cohort.to_sym
end

def get_hobby
  hobby = ""
  puts "Please enter hobby: "
  return gets.chomp!
end

def get_height
  hobby = ""
  puts "Please enter height: "
  return gets.chomp!
end

def print_by_cohort(students)
  cohorts = ["november", "february", "april"]
  cohorts.each do |cohort|
    puts "#{cohort.capitalize} Cohort"
    students.each do |student|
      if student[:cohort].to_s == cohort
        puts "#{student[:name].ljust(30)} #{student[:height].ljust(5)} #{student[:hobby].ljust(10)}"
      end
    end
  end
end

interactive_menu
