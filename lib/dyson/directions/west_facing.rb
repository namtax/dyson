module Dyson
  module Directions
    module WestFacing
      def self.go(hoover, room)
        hoover.x -= 1 if hoover.x > 0
      end
    end
  end
end
