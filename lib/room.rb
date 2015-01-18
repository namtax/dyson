class Room
  attr_reader :floor

  def initialize(coords, dirt)
    @floor   = Array.new(coords.first) { Array.new(coords.last, :clean) }
    make_a_mess(dirt)
  end

  def add_item(pos, item)
    floor[pos.first][pos.last] = item
  end

  def item_exists?(pos, item)
    floor[pos.first][pos.last] == item
  end

  def in_boundary?(x, y)
    floor[x][y] rescue nil
  end

  private

  def make_a_mess(dirt)
    dirt.each{ |d| add_item(d, :dirt) }
  end
end
