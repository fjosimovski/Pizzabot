class Delivery
  # the command path is following "5x5 (1, 3) (4, 4), (0, 2)"
  def initialize(command)
    @command = command 
    parse_command(command)
  end

  def run
    pizzabot = Pizzabot.new(@grid_size, @drop_points)
    pizzabot.action(@drop_points)
  end

  def command
    @command
  end

  def parse_command(command)
    @grid_size = get_grid(command)
    @drop_points = get_drop_points(command)
  end

  def get_grid(command)
    grid = command.match(/\d+x\d+/)
    raise ArgumentError, 'One grid size is required in format ex. 4x4' if grid.nil?
    grid[0]
  end

  def get_drop_points(command)
    # match drop points in command that are in brackets. Ex: (2,3) or (3, 4)
    points = command.scan(/\(\s*\d+,\s*\d+\s*\)/)
    raise ArgumentError, "At least one drop point is required" if points.empty?
    points
  end
end