def is_move_allowed(pos = {})
  # x is the position on the WEST/EAST axis
  # y is the position on the NORTH/SOUTH axis
  # o is the orientation (WEST, EAST, NORTH, SOUTH)
  # returns true if the Robot can move
  # returns false when the Robot is facing
  # an edge

  if (pos[:x] == 0 && pos[:o] == 'W') || (pos[:x] == 5 && pos[:o] == 'E')
    return false
  elsif (pos[:y] == 0 && pos[:o] == 'S') || (pos[:y] == 5 && pos[:o] == 'N')
    return false
  end
  return true
end

def turn_the_robot(direction, orientation)
  # returns the new orientation of the Robot

  result = ''
  case orientation
  when 'N'
    result = direction == 'LEFT' ? 'W' : 'E'
  when 'W'
    result = direction == 'LEFT' ? 'S' : 'N'
  when 'S'
    result = direction == 'LEFT' ? 'E' : 'W'
  when 'E'
    result = direction == 'LEFT' ? 'N' : 'S'
  end
  return result
end

def move_the_robot(pos = {})
  # returns a hash with the new position of the robot
  # after it has move forward one tile

  case pos[:o]
  when 'N'
    pos[:y] += 1
  when 'W'
    pos[:x] -= 1
  when 'S'
    pos[:y] -= 1
  when 'E'
    pos[:x] += 1
  end
  return {x: pos[:x], y: pos[:y], o: pos[:o]}
end

def place_the_robot(position_string)
  # returns a hash with the position of the robot
  # matching what the user has entered

  pos = false
  array = position_string.split("")
  return pos if array.size > 8 
  x = array[5].to_i - 1
  y = array[6].to_i - 1
  o = array[7]

  if x < 0 || x > 5
    puts 'X has to be between 1 and 6'
  elsif y < 0 || y > 5
    puts 'Y has to be between 1 and 6'
  elsif !'NSWE'.include?(o)
    puts 'The orientation has to be in NWSE'
  else
    pos = {x: x, y: y, o: o}
  end
  return pos
end
