require 'spec_helper'

describe 'Location' do
  let(:loc) { Location.new(0, 0) }

  describe 'a new location' do
    it 'is created with coordinates' do
      loc.x.must_equal 0
      loc.y.must_equal 0
    end

    it 'is surronded by neighboring locations' do
      loc.adjacents.size.must_equal 8
    end
  end
end
