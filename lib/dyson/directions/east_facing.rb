module Dyson
  module Directions
    module EastFacing
      def self.go(hoover)
        hoover.x += 1 
      end

      def self.undo(hoover)
        hoover.x -= 1
      end
    end
  end
end
