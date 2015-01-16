class Hoover
  attr_accessor :patches_cleaned, :room, :x, :y

  def initialize(start_pos, room)
    @x, @y           = start_pos.split.map(&:to_i)
    @room            = room
    @patches_cleaned = 0 
  end

  def run(directions)
    clean if on_dirt_patch?

    directions.each_char do |direction|
      go(direction) && (clean if on_dirt_patch?)
    end
  end

  def position
    "#{x} #{y}"
  end
  
  private

  def on_dirt_patch?
    room.dirt_patch?(position)
  end

  def clean
    self.patches_cleaned += 1 
    room.remove_dirt(position)
  end

  def go(direction)
    if direction == 'N'
      go_north
    elsif direction == 'S'
      go_south
    elsif direction == 'E'
      go_east
    elsif direction == 'W'
      go_west
    end    
  end

  def go_north
    @y += 1 if @y < room.y
  end

  def go_south
    @y -= 1 if @y > 0
  end

  def go_east
    @x += 1 if @x < room.x
  end

  def go_west
    @x -= 1 if @x > 0
  end
end
