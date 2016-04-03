class Rover
  attr_reader :x_pos, :y_pos, :orientation

  MOVES = {
    'N' => { x: 0, y: 1 },
    'E' => { x: 1, y: 0 },
    'S' => { x: 0, y: -1 },
    'W' => { x: -1, y: 0 },
  }

  TURNS = {
    'N' => { 'L' => 'W', 'R' => 'E' },
    'E' => { 'L' => 'N', 'R' => 'S' },
    'S' => { 'L' => 'E', 'R' => 'W' },
    'W' => { 'L' => 'S', 'R' => 'N' },
  }

  def initialize(x, y, orientation, instructions)
    @x_pos = x.to_i
    @y_pos = y.to_i
    @orientation = orientation
    @instructions = instructions
    @is_moving = false
  end

  def is_moving?
    @is_moving
  end

  def run!
    @is_moving = true
    @instructions.each do |instruction|
      process_instruction!(instruction)
    end
    @is_moving = false
  end

  def plateau=(plateau)
    @plateau = plateau
  end

  private

  def process_instruction!(instruction)
    if instruction =~ /^(L|R)$/
      process_turn!(instruction)
    elsif instruction == 'M'
      process_move!
    end
  end

  def process_turn!(direction)
    @orientation = TURNS[@orientation][direction]
  end

  def process_move!
    new_x = @x_pos + MOVES[@orientation][:x]
    new_y = @y_pos + MOVES[@orientation][:y]
    raise 'Can\'t move to inaccessible field' unless @plateau.accessible_field?(new_x, new_y)
    @x_pos = new_x
    @y_pos = new_y
  end
end
