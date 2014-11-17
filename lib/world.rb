require 'set'

class World
  attr_accessor :grid

  def initialize
    @grid = Set.new
  end

  def add(location)
    @grid << location
  end

  def remove(location)
    @grid.delete(location)
  end

  def number_of_living_cells
    @grid.size
  end
  alias_method :size, :number_of_living_cells

  def unsustainable_locations
    @grid.select { |loc| !survives?(loc) }
  end

  def germinal_locations
    potential_perimeter.select { |loc| fertile?(loc) }
  end

  private

  def potential_perimeter
    possible_locations = Set.new
    @grid.each { |loc| possible_locations |= loc.adjacents }
    possible_locations.subtract @grid
  end

  def fertile?(location)
    alive_nearby(location) == 3
  end

  def survives?(location)
    alive_nearby(location) == 2 || alive_nearby(location) == 3
  end

  def alive_nearby(location)
    location.adjacents.count { |loc| @grid.include?(loc) }
  end
end
