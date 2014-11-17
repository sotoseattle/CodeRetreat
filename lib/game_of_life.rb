require_relative './world'
require_relative './chart'

class GOL
  attr_reader :world

  def initialize
    @world = World.new
  end

  def add(another_living_cell_location)
    @world.add(another_living_cell_location)
    self
  end

  def remove(living_cell_location)
    @world.remove(living_cell_location)
  end

  def tick
    will_die   = @world.unsustainable_locations
    will_spawn = @world.germinal_locations

    will_die.each   { |cell| remove(cell) }
    will_spawn.each { |cell| add(cell) }
  end

  def visualization
    Chart.new(@world).to_2D
  end
end
