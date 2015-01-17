class Room
  attr_reader :floor

  def initialize(dimensions, dirt)
    @floor   = Array.new(dimensions.first) { Array.new(dimensions.last, :clean) }
    add_dirt(dirt)
  end

  def add_item(p, item)
    floor[p.first][p.last] = item
  end

  def item_present?(pos, item)
    position(pos) == item
  end

  private

  def add_dirt(dirt)
    dirt.each{ |d| add_item(d, :dirt) }
  end

  def format_pos(pos)
    pos.split.map(&:to_i)
  end

  def position(p)
    floor[p.first][p.last]
  end
end
