require_relative '../../../../lib/algorithms/graph/kruskal_mst'
require_relative '../../../../lib/data_structures/graphs/edge_weighted'
require_relative '../../../../lib/data_structures/graphs/edge'

RSpec.describe Algorithms::Graph::KruskalMST do
  let(:graph) { Algorithms::DataStructures::Graphs::EdgeWeighted.new(6) }

  subject(:algorithm) { described_class.new(graph).to_a }

  it { is_expected.to match_array([]) }

  context 'with one edge' do
    let(:edge2) { Algorithms::DataStructures::Graphs::Edge.new(1, 4, 2) }

    before { graph.add(edge2) }

    it { is_expected.to match_array([edge2]) }
  end

  context 'with all edges' do
    let(:edge1) { Algorithms::DataStructures::Graphs::Edge.new(0, 1, 1) }
    let(:edge2) { Algorithms::DataStructures::Graphs::Edge.new(1, 4, 2) }
    let(:edge3) { Algorithms::DataStructures::Graphs::Edge.new(4, 3, 3) }
    let(:edge4) { Algorithms::DataStructures::Graphs::Edge.new(4, 5, 4) }
    let(:edge5) { Algorithms::DataStructures::Graphs::Edge.new(1, 2, 5) }
    let(:edge6) { Algorithms::DataStructures::Graphs::Edge.new(2, 5, 6) }
    let(:edge7) { Algorithms::DataStructures::Graphs::Edge.new(0, 2, 7) }
    let(:edge8) { Algorithms::DataStructures::Graphs::Edge.new(0, 3, 8) }
    let(:edge9) { Algorithms::DataStructures::Graphs::Edge.new(3, 5, 9) }

    before do
      graph.add(edge1)
      graph.add(edge2)
      graph.add(edge3)
      graph.add(edge4)
      graph.add(edge5)
      graph.add(edge6)
      graph.add(edge7)
      graph.add(edge8)
      graph.add(edge9)
    end

    it { is_expected.to match_array([edge1, edge2, edge3, edge4, edge5]) }
  end
end
