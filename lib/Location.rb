class Location
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def adjacents
    [x + 1, x, x - 1].product([y - 1, y, y + 1]).reject { |a| a == [x, y] }
  end

  def adjacent?(other)
    adjacents.include?(other.to_a)
  end

  def to_a
    [@x, @y]
  end
end
