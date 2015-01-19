require 'dyson/directions/north_facing'
require 'dyson/directions/south_facing'
require 'dyson/directions/east_facing'
require 'dyson/directions/west_facing'

module Dyson
  module Direction
    def self.build
      {
        N: Directions::NorthFacing,
        S: Directions::SouthFacing,
        E: Directions::EastFacing,
        W: Directions::WestFacing
      }
    end
  end
end
