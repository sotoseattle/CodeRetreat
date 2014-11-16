require_relative './location'

class Cell
  attr_accessor :location, :neighbors, :alive

  def initialize(args)
    @location = args[:at]
    @neighbors = []
  end

  def survives?
    neighbors_alive == 2 || neighbors_alive == 3
  end

  def connect_with(other)
    if is_adjacent?(other)
      @neighbors << other unless @neighbors.include?(other)
      other.neighbors << self unless other.neighbors.include?(self)
    end
    self
  end

  def suicide!
    @neighbors.each { |other| other.remove(self) }
    @neighbors = []
  end

  def to_s
    @location.to_a.to_s
  end

  protected

  def remove(cell)
    @neighbors.delete(cell)
  end

  private

  def neighbors_alive
    @neighbors.count
  end

  def is_adjacent?(other)
    location.is_adjacent?(other.location)
  end
end
