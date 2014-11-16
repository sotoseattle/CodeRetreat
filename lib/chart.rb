require_relative './location'

class Chart
  def initialize(bunch_of_locations)
    @locations = bunch_of_locations
  end

  def to_2D
    return '' if @locations.empty?

    bottom_left, top_right = frame
    width  = top_right.x - bottom_left.x + 1
    heigth = top_right.y - bottom_left.y + 1

    arr = ['.'] * width * heigth

    @locations.each { |loc| arr[loc.x * width + loc.y] = 'X' }

    arr.each_slice(width).map { |sub| sub << "\n" }.join
  end

  def frame
    bottom_left_corner = Location.new(Float::INFINITY, Float::INFINITY)
    top_right_corner   = Location.new(-Float::INFINITY, -Float::INFINITY)

    @locations.each do |loc|
      bottom_left_corner.x = loc.x if loc.x < bottom_left_corner.x
      bottom_left_corner.y = loc.y if loc.y < bottom_left_corner.y
      top_right_corner.x   = loc.x if loc.x > top_right_corner.x
      top_right_corner.y   = loc.y if loc.y > top_right_corner.y
    end

    [bottom_left_corner, top_right_corner]
  end
end
