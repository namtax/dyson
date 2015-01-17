module Directions
  module SouthFacing
    def self.go(hoover, room)
      hoover.y -= 1 if hoover.y > 0
    end
  end
end
