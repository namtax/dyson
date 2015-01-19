module Dyson
  module Directions
    module NorthFacing
      def self.go(hoover)
        hoover.y += 1 
      end

      def self.undo(hoover)
        hoover.y -= 1
      end
    end
  end
end
