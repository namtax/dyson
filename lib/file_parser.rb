require 'input_validator'

class FileParser
  attr_reader :input

  def initialize
    raise error_message unless File.exists?(file_path)
    @input  = File.readlines(file_path).map(&:strip)
    InputValidator.new(input).validate
    parse
  end

  def room_dimensions
    input[0]
  end

  def hoover_pos
    input[1]
  end

  def dirt_patches
    input[2...-1]
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

  def parse
    input.map!
      .with_index{ |i, index| index == 5 ? i : i.split.map(&:to_i)  }
      .compact
  end
end
