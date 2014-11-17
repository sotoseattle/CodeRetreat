Location = Struct.new(:x, :y) do
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

  protected

  def hash
    to_a.hash
  end
end
