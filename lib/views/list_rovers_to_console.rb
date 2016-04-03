class ListRoversToConsole
  def initialize(rovers)
    @rovers = rovers
  end

  def render
    p build_string
  end

  private

  def build_string
    str = ""
    @rovers.each do |rover|
      str += "#{rover.x_pos} #{rover.y_pos} #{rover.orientation}\n"
    end
    str
  end
end
