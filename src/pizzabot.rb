#!/usr/bin/env ruby
class Pizzabot
  def initialize(grid_size)
    @grid_size = grid_size
  end

  def grid_size
    @grid_size
  end

  def move(current_position, required_position)
    @current_position = current_position
    @required_position = required_position
    path = ""
    until @current_position == @required_position do
      path += move_x(@current_position[0], @required_position[0])
      path += move_y(@current_position[1], @required_position[1])
    end
    path += "D"
    path
  end

  def move_x(current_position, required_position)
    x_path = ""
    until current_position == required_position do
      case
        when current_position < required_position
          current_position += 1
          x_path += "W"
        when current_position > required_position
          current_position -= 1
          x_path += "E"
      end
    end
    x_path
  end

  def move_y(current_position, required_position)
    y_path = ""
    until current_position == required_position do
      case
      when current_position < required_position
        current_position += 1
        y_path += "N"
      when current_position > required_position
        current_position -= 1
        y_path += "S"
      end
    end
    y_path
  end
end