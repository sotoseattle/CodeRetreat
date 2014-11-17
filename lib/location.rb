class Location
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def ==(other)
    to_a == other.to_a
  end
  alias_method :eql?, :==

  def adjacents
    adj = [x + 1, x, x - 1].product([y - 1, y, y + 1])
          .map { |coords| Location.new(*coords) }
    adj.delete self
    adj
  end

  def to_a
    [x, y]
  end

  protected

  def hash
    to_a.hash
  end
end
