require_relative '../builders/string_builder'
require_relative '../views/list_rovers_to_console'

class InputProcessor
  def initialize(input)
    @builder = StringBuilder.new(input) if input.is_a?(String)
  end

  def process
    plateau = @builder.build_plateau
    rovers = @builder.build_rovers
    plateau.rovers = rovers
    rovers.each do |rover|
      rover.plateau = plateau
      rover.run!
    end
    ListRoversToConsole.new(rovers).render
  end
end
