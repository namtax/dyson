module Directions
  module EastFacing
    def self.go(hoover, room)
      hoover.x += 1 if room.floor[hoover.x+1]
    end
  end
end
