module Dyson
  module Directions
    module NorthFacing
      def self.go(hoover, room)
        hoover.y += 1 if room.in_boundary?(hoover.x, hoover.y+1)
      end
    end
  end
end
