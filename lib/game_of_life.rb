require_relative './cell'
require_relative './chart'

class GOL
  attr_reader :living_cells

  def initialize
    @living_cells = []
  end

  def add(another_cell)
    @living_cells.each { |cell| cell.connect_with(another_cell) }
    @living_cells << another_cell
    self
  end

  def tick
    survivors, deceased = @living_cells.partition(&:survives?)
    deceased.each(&:suicide!)
    @living_cells = survivors
  end

  def visualization
    chart = Chart.new(living_cells.map(&:location))
    chart.to_2D
  end
end
