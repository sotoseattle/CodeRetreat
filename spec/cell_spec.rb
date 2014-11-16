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
end
