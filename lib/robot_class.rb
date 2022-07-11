class Robot
	attr_accessor :x, :y, :o
  
  def initialize(x, y, o)
    @x = x
    @y = y
    @o = o
  end
  
  def is_move_allowed()
    # x is the position on the WEST/EAST axis
    # y is the position on the NORTH/SOUTH axis
    # o is the orientation (WEST, EAST, NORTH, SOUTH)
    # returns true if the Robot can move
    # returns false when the Robot is facing an edge
  
    if (@x == 0 && @o == 'W') || (@x == 5 && @o == 'E')
      return false
    elsif (@y == 0 && @o == 'S') || (@y == 5 && @o == 'N')
      return false
    end
    return true
  end
  
  def turn_the_robot(direction)
    # turns the robot in the required direction

    case @o
    when 'N'
      @o = direction == 'LEFT' ? 'W' : 'E'
    when 'W'
      @o = direction == 'LEFT' ? 'S' : 'N'
    when 'S'
      @o = direction == 'LEFT' ? 'E' : 'W'
    when 'E'
      @o = direction == 'LEFT' ? 'N' : 'S'
    end
  end
  
  def move_the_robot()
    # move the robot one tile forward
  
    case @o
    when 'N'
      @y += 1
    when 'W'
      @x -= 1
    when 'S'
      @y -= 1
    when 'E'
      @x += 1
    end
  end
  
end