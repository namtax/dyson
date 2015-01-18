module Dyson
  module Directions
    module EastFacing
      def self.go(hoover, room)
        hoover.x += 1 if room.in_boundary?(hoover.x+1, hoover.y)
      end
    end
  end
end
