require_relative '../../../../lib/data_structures/graphs/directed_edge.rb'
require_relative '../../../../lib/data_structures/graphs/edge_weighted_digraph.rb'

RSpec.describe Algorithms::DataStructures::Graphs::EdgeWeightedDigraph do
  let(:graph) { described_class.new }

  describe '#adj' do
    it 'returns empty list when edges adjusted to any vertex' do
      expect(graph.adj(0)).to eq([])
      expect(graph.adj(1)).to eq([])
    end

    context 'when edge is added' do
      let(:edge) { Algorithms::DataStructures::Graphs::DirectedEdge.new(0, 1, 100) }

      before { graph.add(edge) }

      it 'returns added edge' do
        expect(graph.adj(0)).to eq([edge])
        expect(graph.adj(1)).to eq([])
      end
    end
  end

  describe 'edges' do
    let(:edge) { Algorithms::DataStructures::Graphs::DirectedEdge.new(0, 1, 100) }

    subject { graph.edges }

    before { graph.add(edge) }

    it { is_expected.to match_array([edge]) }
  end
end
