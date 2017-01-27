require_relative '../../../../lib/algorithms/graph/breadth_first_paths'
require_relative '../../../../lib/data_structures/graphs/indirected'

RSpec.describe Algorithms::Graph::BreadthFirstPaths do
  let(:number_of_vertices) { 4 }
  let(:graph) { DataStructures::Graphs::Indirected.new(number_of_vertices) }

  subject(:paths) { described_class.new(graph, 2) }

  it { is_expected.to match_array([2]) }

  context 'with one edge' do
    before { graph.add_edge(2, 1) }

    it { is_expected.to match_array([1, 2]) }
  end

  context 'with two connected neighbors' do
    before do
      graph.add_edge(2, 1)
      graph.add_edge(2, 3)
    end

    it { is_expected.to match_array([1, 2, 3]) }
  end

  context 'with two sequentially connected neighbors' do
    before do
      graph.add_edge(2, 3)
      graph.add_edge(3, 4)
    end

    it { is_expected.to match_array([2, 3, 4]) }
  end

  context 'with cycle' do
    before do
      graph.add_edge(2, 3)
      graph.add_edge(3, 4)
      graph.add_edge(4, 2)
    end

    it { is_expected.to match_array([2, 3, 4]) }
  end
end
