require 'dyson/directions/north_facing'
require 'dyson/directions/south_facing'
require 'dyson/directions/east_facing'
require 'dyson/directions/west_facing'

module Dyson
  class Hoover
    attr_accessor :direction, :patches_cleaned, :room, :x, :y

    DIR_MAP = {
      N: Directions::NorthFacing,
      S: Directions::SouthFacing,
      E: Directions::EastFacing,
      W: Directions::WestFacing
    }

    def initialize(coords, room)
      @x, @y           = coords.first, coords.last
      @room            = room
      @patches_cleaned = 0
      clean
    end

    def run(directions)
      directions.each_char do |d|
        self.direction = DIR_MAP[d.to_sym]
        go
        clean
      end
    end

    def go
      direction.go(self, room)
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
      room.item_exists?(position, :dirt)
    end
  end
end
