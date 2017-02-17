require_relative '../../../../lib/data_structures/graphs/edge.rb'
require_relative '../../../../lib/data_structures/graphs/edge_weighted.rb'

RSpec.describe Algorithms::DataStructures::Graphs::EdgeWeighted do
  let(:graph) { described_class.new(2) }

  describe '#adj' do
    it 'returns empty list when edges adjusted to any vertex' do
      expect(graph.adj(0)).to eq([])
      expect(graph.adj(1)).to eq([])
    end

    context 'when edge is added' do
      let(:edge) { Algorithms::DataStructures::Graphs::Edge.new(0, 1, 100) }

      before { graph.add(edge) }

      it 'returns added edge' do
        expect(graph.adj(0)).to eq([edge])
        expect(graph.adj(1)).to eq([edge])
      end
    end
  end
end
