require './src/delivery'
require './src/pizzabot'

puts "Enter the command for delivering in following pattern ex: '5x5 (2,3), (3,4), (0,1)' or press ENTER to run the default one"
command = gets.chomp
command = '5x5 (2,3), (3,4), (0,1)' if command.empty?

delivery = Delivery.new command
result = delivery.run
puts result