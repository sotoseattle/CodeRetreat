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
    it 'I can add a new live cell to my empty game' do
      game = empty_game
      ret = game.add(cell_at(0, 0))
      ret.must_be_kind_of GOL
      game.living_cells.must_equal 1
    end

    it 'after a tick the single cell dies alone' do
      game = empty_game.add(cell_at(0, 0))
      game.tick
      game.living_cells.must_equal 0
    end
  end

  describe 'A game with 3 initial cells' do
    it 'in L and next to each other' do
      game = empty_game.add(cell_at(0, 0)).add(cell_at(0, 1)).add(cell_at(1, 0))
      game.living_cells.must_equal 3
      game.tick
      game.living_cells.must_equal 3
    end

    it 'in a row' do
      game = empty_game.add(cell_at(0, 0)).add(cell_at(0, 1)).add(cell_at(0, 2))
      game.living_cells.must_equal 3
      game.tick
      game.living_cells.must_equal 1
      game.tick
      game.living_cells.must_equal 0
      game.tick
      game.living_cells.must_equal 0
    end

    it 'away from each other' do
      game = empty_game
             .add(cell_at(0, 0)).add(cell_at(0, 10)).add(cell_at(0, 200))
      game.living_cells.must_equal 3
      game.tick
      game.living_cells.must_equal 0
    end
  end

  describe 'A game with multiple initial cells' do
    it 'nice and comfy' do
      game = empty_game.add(cell_at(0, 0)).add(cell_at(0, 1))
             .add(cell_at(1, 0)).add(cell_at(1, 1))
      game.living_cells.must_equal 4
      game.tick
      game.living_cells.must_equal 4
    end

    it 'way too crowded' do
      game = empty_game.add(cell_at(0, 0)).add(cell_at(0, 1)).add(cell_at(0, 2))
             .add(cell_at(1, 0)).add(cell_at(1, 1)).add(cell_at(1, 2))
             .add(cell_at(2, 0)).add(cell_at(2, 1)).add(cell_at(2, 2))
      game.living_cells.must_equal 9
      game.tick
      game.living_cells.must_equal 4
      game.tick
      game.living_cells.must_equal 0
    end
  end
end
