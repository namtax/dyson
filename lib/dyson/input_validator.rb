module Dyson
  class InputValidator
    attr_reader :input

    REQUIRED_NUMBER_OF_COMMANDS = 6
    REQUIRED_NUMBER_OF_COORDS   = 5
    INSTRUCTION_WHITELIST = /(N|S|E|W)/

    def initialize(input)
      @input = input
    end

    def validate
      raise 'Please provide full input use --help for more info' unless valid_input?
      raise 'Please provide valid coords use --help for more info' unless valid_input_coords?
      raise 'Please provide valid instructions use --help for more info' unless valid_instructions?
    end

    def valid_input?
      input.size == REQUIRED_NUMBER_OF_COMMANDS
    end

    def valid_input_coords?
      (valid_coords.count == REQUIRED_NUMBER_OF_COORDS) &&
        (item_positions).all?{ |x,y| within_room_boundaries(x, y) }
    end

    def valid_coords
      input_coords.grep(/^(\d+) (\d+)$/)
    end

    def input_coords
      input[0...-1]
    end

    def item_positions
      input_parsed[1..-1]
    end

    def input_parsed
      input[0...-1].map { |x| x.split.map(&:to_i) }
    end

    def room
      input_parsed.first
    end

    def within_room_boundaries(x, y)
      (0 <= x && x < room[0] && y >= 0 && y < room[1])
    end

    def valid_instructions?
      input.last.each_char.all?{ |x| x =~ INSTRUCTION_WHITELIST }
    end
  end
end
