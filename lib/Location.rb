class Location
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    self.x == other.x && self.y == other.y
  end

  def adjacents
    [x+1, x, x-1].product([y-1, y, y+1]).reject { |a| a == [x,y] }
  end

  def is_adjacent?(other)
    adjacents.include?([other.x, other.y])
  end
end
