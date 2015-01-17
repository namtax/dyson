require 'directions/north_facing'
require 'directions/south_facing'
require 'directions/east_facing'
require 'directions/west_facing'

class Hoover
  attr_accessor :patches_cleaned, :room, :x, :y

  DIR_MAP = { 
     N: Directions::NorthFacing,
     S: Directions::SouthFacing,
     E: Directions::EastFacing,
     W: Directions::WestFacing
  }

  def initialize(start_pos, room)
    @x, @y           = start_pos.first, start_pos.last
    @room            = room
    @patches_cleaned = 0 
    clean
  end

  def run(directions)
    directions.each_char do |d|
      DIR_MAP[d.to_sym].go(self, room)
      clean
    end
  end

  def position
    [x, y]
  end

  def status
    [position.join(" "), patches_cleaned].join("\n")
  end
  
  private

  def clean
    if on_dirt_patch?
      room.add_item(position, :clean)
      self.patches_cleaned += 1 
    end
  end

  def on_dirt_patch?
    room.item_present?(position, :dirt)
  end
end
