class Room
  attr_reader :x, :y
  
  def initialize(dimensions, dirt)
    @x, @y  = dimensions.split.map(&:to_i)
    @dirt   = dirt
  end

  def dirt_patch?(position)
    dirt.include?(position)
  end

  def remove_dirt(position)
    dirt.delete(position)
  end

  private
  attr_reader :dirt
end
