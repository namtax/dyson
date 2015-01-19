module Dyson
  module Directions
    module SouthFacing
      def self.go(hoover)
        hoover.y -= 1
      end

      def self.undo(hoover)
        hoover.y += 1
      end
    end
  end
end
