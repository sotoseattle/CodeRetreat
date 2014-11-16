require 'spec_helper'

describe 'Game of Life' do
  let(:empty_game) { GOL.new }

  def cell_at(x, y)
    Cell.new(at: Location.new(x, y))
  end

  describe 'A new game' do
    it 'has no cells' do
      empty_game.living_cells.must_equal 0
    end

    it 'after a tick nothing changes' do
      empty_game.tick
      empty_game.living_cells.must_equal 0
    end
  end

  describe 'A game with a single cell' do
    it 'I can add new live cells to a game' do
      game = empty_game
      game.add(cell_at(0,0))
      game.living_cells.must_equal 1
    end

    it 'after a tick the single cell dies alone' do
      game = empty_game
      game.add(cell_at(0,0))
      game.tick
      game.living_cells.must_equal 0
    end
  end

  describe 'A game with 3 cells' do
    it 'in L and next to each other' do
      game = empty_game
      game.add(cell_at(0,0))
      game.add(cell_at(0,1))
      game.add(cell_at(1,0))
      game.living_cells.must_equal 3
      game.tick
      game.living_cells.must_equal 3
    end

    it 'in a row' do
      game = empty_game
      game.add(cell_at(0,0))
      game.add(cell_at(0,1))
      game.add(cell_at(0,2))
      game.living_cells.must_equal 3
      game.tick
      game.living_cells.must_equal 1
      # game.tick
      # game.size.must_equal 0
    end
  end

  describe 'A new cell' do
    it 'is created at a specific location' do
      loc = Location.new(0, 0)
      cell_at(0,0).location.must_equal loc
    end
  end
end
