class Hoover
  attr_accessor :dirt_patches, :patches_cleaned, :position, :x, :y

  def initialize(start_pos, room, dirt_patches = [])
    @x, @y           = start_pos.split.map(&:to_i)
    @rm_x, @rm_y     = room.split.map(&:to_i)
    @dirt_patches    = dirt_patches
    @patches_cleaned = 0 
  end

  def move(directions)
    if on_dirt_patch?
      clean
    end

    directions.each_char do |direction|
      if direction == 'N'
        move_north
      elsif direction == 'S'
        move_south
      elsif direction == 'E'
        move_east
      elsif direction == 'W'
        move_west
      end

      if on_dirt_patch?
        clean
      end
    end
  end

  def position
    "#{x} #{y}"
  end
  
  private

  def on_dirt_patch?
    dirt_patches.include?(position)
  end

  def clean
    self.patches_cleaned += 1 
    self.dirt_patches.delete(position)
  end

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
