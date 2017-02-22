require_relative '../../../../lib/data_structures/graphs/directed_edge.rb'

RSpec.describe Algorithms::DataStructures::Graphs::DirectedEdge do
  let(:from) { 10 }
  let(:to) { 7 }
  let(:weight) { 120 }

  let(:edge) { described_class.new(from, to, weight) }

  describe '<=>' do
    let(:light_edge) { described_class.new(1, 2, weight - 1) }
    let(:heavy_edge) { described_class.new(3, 4, weight + 1) }

    it 'equals to itsef' do
      expect(edge <=> edge).to be_zero
    end

    it 'heavier that light edge' do
      expect(edge <=> light_edge).to eq(1)
    end

    it 'heavier that light edge' do
      expect(edge <=> heavy_edge).to eq(-1)
    end
  end
end
