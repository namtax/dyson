class Hoover
  attr_accessor :position, :x, :y

  def initialize(start_pos, room)
    @x, @y       = start_pos.split.map(&:to_i)
    @rm_x, @rm_y = room.split.map(&:to_i)
  end

  def move(direction)
    if direction == 'N'
      move_north
    elsif direction == 'S'
      move_south
    elsif direction == 'E'
      move_east
    elsif direction == 'W'
      move_west
    end
  end

  def position
    "#{x} #{y}"
  end

  private

  def move_north
    @y += 1 if @y < @rm_y
  end

  def move_south
    @y -= 1 if @y > 0
  end

  def move_east
    @x += 1 if @x < @rm_x
  end

  def move_west
    @x -= 1 if @x > 0
  end
end
