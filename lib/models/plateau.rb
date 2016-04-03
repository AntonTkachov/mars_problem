class Plateau
  def initialize(x, y)
    @right = x.to_i
    @top = y.to_i
  end

  def accessible_field?(x, y)
    include?(x, y) && field_free?(x, y)
  end

  def rovers=(rovers)
    @rovers = rovers
  end

  private

  def include?(x, y)
    x >= 0 && x <= @right && y >= 0 && y <= @top
  end

  def field_free?(x, y)
    @rovers.each do |rover|
      return false if rover.x_pos == x && rover.y_pos == y && !rover.is_moving?
    end
  end
end
