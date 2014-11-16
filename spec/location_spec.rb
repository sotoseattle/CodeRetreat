require 'spec_helper'

describe 'Location' do
  let(:loc) { Location.new(0, 0) }

  describe 'a new location' do
    it 'is created with coordinates' do
      loc.x.must_equal 0
      loc.y.must_equal 0
    end
  end

  describe '#adjacents and #is_adjacent?' do
    it { Location.new(rand, rand).adjacents.size.must_equal 8 }
    it { loc.is_adjacent?(Location.new(0,1)).must_equal true }
    it { loc.is_adjacent?(Location.new(2,1)).must_equal false }
  end

  describe '#==' do
    it { loc.must_equal Location.new(0,0) }
    it { loc.wont_equal Location.new(0,1) }
  end
end
