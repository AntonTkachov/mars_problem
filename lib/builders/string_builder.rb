require_relative '../models/plateau'
require_relative '../models/rover'

class StringBuilder
  def initialize(input)
    @rows = input.lines.map(&:chomp)
  end

  def build_plateau
    x, y = @rows[0].split(' ')
    Plateau.new(x, y)
  end

  def build_rovers
    @rows[1..-1].each_slice(2).map do |rover_rows|
      build_rover(rover_rows)
    end
  end

  private
  def build_rover(rover_rows)
    x_pos, y_pos, orientation = rover_rows[0].split(' ')
    instructions = rover_rows[1].split('')
    Rover.new(x_pos, y_pos, orientation, instructions)
  end
end
