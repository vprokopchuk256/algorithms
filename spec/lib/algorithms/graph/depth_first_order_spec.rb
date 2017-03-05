require_relative '../../../../lib/algorithms/graph/depth_first_order'
require_relative '../../../../lib/data_structures/graphs/directed'
require_relative '../../../../lib/data_structures/graphs/edge_weighted_digraph'
require_relative '../../../../lib/data_structures/graphs/directed_edge'

RSpec.describe Algorithms::Graph::DepthFirstOrder do
  context 'directed graph' do
    let(:graph) { Algorithms::DataStructures::Graphs::Directed.new() }

    subject(:paths) { described_class.new(graph, 2).to_a }

    it { is_expected.to eq([2]) }

    context 'with one edge' do
      before { graph.add_edge(2, 1) }

      it { is_expected.to eq([2, 1]) }
    end

    context 'with two connected neighbors' do
      before do
        graph.add_edge(2, 1)
        graph.add_edge(2, 3)
      end

      it { is_expected.to eq([2, 1, 3]) }
    end

    context 'with two sequentially connected neighbors' do
      before do
        graph.add_edge(2, 3)
        graph.add_edge(3, 4)
      end

      it { is_expected.to eq([2, 3, 4]) }
    end

    context 'with cycle' do
      before do
        graph.add_edge(2, 3)
        graph.add_edge(3, 4)
        graph.add_edge(4, 2)
      end

      it { is_expected.to eq([2, 3, 4]) }
    end
  end

  context 'edge_weighted_digraph' do
    let(:graph) { Algorithms::DataStructures::Graphs::EdgeWeightedDigraph.new() }

    subject(:paths) { described_class.new(graph, 2, adj_attribute: :to).to_a }

    it { is_expected.to match_array([2]) }

    context 'with one edge' do
      before { graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(2, 1, 100)) }

      it { is_expected.to eq([2, 1]) }
    end

    context 'with two connected neighbors' do
      before do
        graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(2, 1, 100))
        graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(2, 3, 100))
      end

      it { is_expected.to eq([2, 1, 3]) }
    end

    context 'with two sequentially connected neighbors' do
      before do
        graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(2, 3, 100))
        graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(3, 4, 100))
      end

      it { is_expected.to eq([2, 3, 4]) }
    end

    context 'with cycle' do
      before do
        graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(2, 3, 100))
        graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(3, 4, 100))
        graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(4, 2, 100))
      end

      it { is_expected.to eq([2, 3, 4]) }
    end
  end
end
