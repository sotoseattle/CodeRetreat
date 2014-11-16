require_relative './cell'

class GOL
  def initialize
    @living_cells = []
  end

  def living_cells
    @living_cells.size
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
end
