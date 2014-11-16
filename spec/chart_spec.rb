require 'spec_helper'

describe 'Chart' do
  describe 'initialize and #frame' do
    it 'without locations there is not much of a chart' do
      c = Chart.new
      c.instance_variable_get(:@width).must_equal 0
    end

    it 'reframes a set of locations so all can be displayed' do
      known_min, known_max = Location.new(0, 2), Location.new(200, 300)

      bunch_of_locations = 5.times.map { Location.new(rand(100) + 10, rand(100) + 10) }
      bunch_of_locations << known_min << known_max
      bunch_of_locations.shuffle!

      chart = Chart.new(bunch_of_locations)
      chart.instance_variable_get(:@bottom_left).must_equal known_min
      chart.instance_variable_get(:@top_right).must_equal known_max
    end
  end

  describe '#to_2D' do
    it 'an empty chart has only dots' do
      bunch_of_locations = []
      chart = Chart.new(bunch_of_locations)
      chart.to_2D.must_equal ''
    end

    it 'builds a stringify 2D map from a set of locations' do
      bunch_of_locations = [*0..5].zip([*0..5]).map { |pair| Location.new(*pair) }
      chart = Chart.new(bunch_of_locations)
      chart.to_2D.must_equal "X.....\n.X....\n..X...\n...X..\n....X.\n.....X\n"
    end
  end
end
