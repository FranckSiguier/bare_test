require_relative "utils"


puts "This is an interface to move a Robot on a 6x6 grid"
puts "You can move your Robot with different commands"
puts "But be careful, your Robot cannot go past the edge"
puts ''
puts "MOVE will make your Robot go forward one tile"
puts "LEFT will make your Robot turn LEFT"
puts "RIGHT will make your Robot turn RIGHT"
puts "REPORT will give you the position of your Robot"
puts "PLACE x, y, o will position you Robot on the grid"
puts ''
puts "EXIT to exit the game"

position = {x: 0, y: 0, o:'N'}
command = ''

while true
  puts ''
  puts "You first need to place the Robot with the command PLACE"
  puts "Place command is as follows PLACE X, Y, O"
  puts "What is you first command ?"
  command = gets.chomp.upcase.gsub(/[\s+\W+]/, "")
  position = place_the_robot(command)
  
  if position == false
    puts "Your PLACE command was not right, please try again"
  else
    break
  end
end

while true
  puts "What is your command ?"
  command = gets.chomp.upcase.gsub(/[\s+\W+]/, "")
  case command
  when /^PLACE.*/
    position = place_the_robot(command)
    puts "Your PLACE command was not right, please try again" if position == false
  when 'LEFT'
    position[:o] = turn_the_robot('LEFT', position[:o])
  when 'RIGHT'
    position[:o] = turn_the_robot('RIGHT', position[:o])
  when 'MOVE'
    if is_move_allowed(position)
      position = move_the_robot(position)
    else
      puts 'The Robot is facing an edge, you need to turn before moving'
    end
  when 'REPORT'
    puts "#{position[:x]}, #{position[:y]}, #{position[:o]}"
  when 'EXIT'
    exit
  end
end

