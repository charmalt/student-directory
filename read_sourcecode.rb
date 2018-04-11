filename = $0
file = File.new(filename, "r")
counter = 1
while (line = file.gets)
    puts "#{line}"
    counter = counter + 1
end
file.close
