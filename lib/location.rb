class Location
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def ==(other)
    self.to_a == other.to_a
  end
  alias_method :eql?, :==

  def adjacents
    [x + 1, x, x - 1].product([y - 1, y, y + 1])
    .reject { |coords| coords == [x, y] }
    .map{|coords| Location.new(*coords)}
  end

  def to_a
    [x, y]
  end

  protected

  def hash
    to_a.hash
  end
end
