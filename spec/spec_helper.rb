require 'minitest/autorun'
require './lib/game_of_life'
require './lib/cell'

def new_cell_at(x, y)
  Cell.new(at: Location.new(x, y))
end
