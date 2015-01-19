require 'dyson/direction'

module Dyson
  class Hoover
    attr_accessor :direction, :patches_cleaned, :room, :x, :y

    def initialize(coords, room)
      @x, @y           = coords.first, coords.last
      @room            = room
      @patches_cleaned = 0
      clean
    end

    def run(directions)
      directions.each_char do |d|
        self.direction = Direction.build[d.to_sym]
        go
        moonwalk if out_of_bounds?
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

    def go
      direction.go(self)
    end

    def moonwalk
      direction.undo(self)
    end

    def out_of_bounds?
      room.out_of_bounds?(x, y)
    end

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
