require 'spec_helper'

describe 'Cell' do
  let(:cell_at_00) { Cell.new(at: Location.new(0, 0)) }

  describe 'A new cell' do
    it 'is created at a specific location' do
      loc = Location.new(0, 0)
      cell_at_00.location.must_equal loc
    end

    it 'sees who is alive around' do
      cell_at_00.neighbors.count.must_equal 0
    end

    it 'if without neighbors, will die alone' do
      cell_at_00.survives?.must_equal false
    end
  end

  describe '#connect_with' do
    it 'two cells can be connected to one another if adjacent' do
      d = Cell.new(at: Location.new(0, 1))
      cell_at_00.connect_with(d)
      cell_at_00.neighbors.must_include d
      d.neighbors.must_include cell_at_00
    end

    it 'two cells wont be connected to one another if set apart' do
      d = Cell.new(at: Location.new(0, 2))
      cell_at_00.connect_with(d)
      cell_at_00.neighbors.wont_include d
      d.neighbors.wont_include cell_at_00
    end
  end

  describe '#suicide!' do
    before(:each) do
      @a = Cell.new(at: Location.new(0, 1))
      @b = Cell.new(at: Location.new(1, 1))
      @c = Cell.new(at: Location.new(1, 0))
      cell_at_00.connect_with(@a).connect_with(@b).connect_with(@c)
    end

    it 'will clear its tracked neighbors' do
      cell_at_00.suicide!
      cell_at_00.neighbors.must_be_empty
    end

    it 'will clear be removed from its neighbors' do
      temp = cell_at_00.neighbors
      cell_at_00.suicide!
      temp.each { |c| c.neighbors.wont_include cell_at_00 }
    end

    it 'wont affect any other cell tracked by neighbors' do
      @a.connect_with(@b).connect_with(@c)
      @b.connect_with(@c)
      temp = cell_at_00.neighbors
      cell_at_00.suicide!
      temp.each { |c| c.send(:neighbors_alive).must_equal 2 }
    end
  end
end
