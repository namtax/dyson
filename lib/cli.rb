require 'file_parser'
require 'room'
require 'hoover'

class CLI
  attr_reader :opts, :hoover, :instructions

  def initialize(opts, fp = FileParser.new)
    @opts         = [*opts]
    room          = Room.new(fp.room_dimensions, fp.dirt_patches)
    @hoover       = Hoover.new(fp.hoover_pos, room)
    @instructions = fp.instructions
  end

  def run
    return warning unless opts_valid?
    return help if help_requested?
    hoover.run(instructions)
    hoover.status
  end

  private

  def warning
    'Dyson doesnt accept any command line arguments'
  end

  def opts_valid?
    help_requested? || opts.empty?
  end

  def help
    ['----------------------------',
     'Please store an input.txt file at Dyson/bin',
     'Example:',
     '5 5 #Room dimensions',
     '1 2 #Hoover start position',
     '1 0 #Zero or more dirt patches',
     '2 2',
     '2 3',
     'NNESEESWNWW #instructions']
  end

  def help_requested?
    opts.size == 1 && opts.first == '--help'
  end
end
