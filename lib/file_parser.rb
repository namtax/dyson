class FileParser
  attr_reader :coords, :input

  REQUIRED_NUMBER_OF_COMMANDS = 6
  REQUIRED_NUMBER_OF_COORDS   = 5
  INSTRUCTION_WHITELIST = /(N|S|E|W)/

  def initialize
    raise error_message unless File.exists?(file_path)
    @input  = File.readlines(file_path).map(&:strip)
    @coords = parse_coords
    validate
  end

  def room_dimensions
    coords[0]
  end

  def hoover_pos
    coords[1]
  end

  def dirt_patches
    coords[2..-1]
  end

  def instructions
    input.last
  end

  private

  def error_message
    'Please store input file at /bin/input.txt'
  end

  def file_path
    'bin/input.txt'
  end

  def parse_coords
    input[0...-1].map{ |i| i.split.map(&:to_i) }
  end

  def validate
    raise 'Please provide full input - see readme!' unless valid_input?
    raise 'Please provide valid coords - see readme!' unless valid_coords?
    raise 'Please provide valid instructions - see readme!' unless valid_instructions?
  end

  def valid_input?
    input.size == REQUIRED_NUMBER_OF_COMMANDS
  end

  def valid_coords?
    (input_coords.grep(/^(\d+) (\d+)$/).count == REQUIRED_NUMBER_OF_COORDS) && 
    ([hoover_pos] + dirt_patches).all?{ |x,y| within_room_boundaries(x, y) }
  end

  def input_coords
    input[0...-1]
  end

  def within_room_boundaries(x, y)
    (0 <= x && x < room_dimensions[0] && y >= 0 && y < room_dimensions[1])
  end

  def valid_instructions?
    instructions.each_char.all?{ |x| x =~ INSTRUCTION_WHITELIST }
  end
end
