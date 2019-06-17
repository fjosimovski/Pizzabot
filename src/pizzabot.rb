#!/usr/bin/env ruby
class Pizzabot
  def initialize(grid_size, drop_points)
    @grid_size = grid_size
    @drop_points = drop_points
  end

  def grid_size
    @grid_size.split("x").map(&:to_i)
  end

  def action(drop_points)
    current_position = [0, 0]
    path_string = ""
    drop_points.each do |drop_point|
      required_position = drop_point.gsub(/\(|\)/, '(' => '', ')' => '').split(',').map(&:to_i)
      next if grid_size.zip(required_position).map{ |a,b| true if b > a}.include? true
      path_string += move(current_position, required_position)
      current_position = required_position
    end
    return path_string.to_s
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
    @current_position[0] = current_position
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
    @current_position[1] = current_position
    y_path
  end
end