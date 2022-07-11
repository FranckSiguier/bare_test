def is_position_allowed(position_string)
  # returns false if the position is not allowed
  # returns the position if it is allowed

  position = false
  array = position_string.split("")
  return position if array.size > 8

  x = array[5].to_i
  y = array[6].to_i
  o = array[7]

  if x < 0 || x > 5
    puts 'X has to be between 0 and 5'
  elsif y < 0 || y > 5
    puts 'Y has to be between 0 and 5'
  elsif !'NSWE'.include?(o)
    puts 'The orientation has to be in NWSE'
  else
    position = {x: x, y: y, o: o} 
  end
  return position
end
