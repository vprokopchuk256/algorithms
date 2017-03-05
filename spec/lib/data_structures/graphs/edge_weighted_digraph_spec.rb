require 'rspec/its'

require_relative '../../../../lib/data_structures/graphs/directed_edge.rb'
require_relative '../../../../lib/data_structures/graphs/edge_weighted_digraph.rb'

RSpec.describe Algorithms::DataStructures::Graphs::EdgeWeightedDigraph do
  subject(:graph) { described_class.new }

  it { is_expected.to be_empty }
  its(:vertices_number) { is_expected.to be_zero }
  its(:edges_number) { is_expected.to be_zero }
  its(:vertices) { is_expected.to match_array([]) }

  it 'returns empty list when edges adjusted to any vertex' do
    expect(graph.adj(0)).to eq([])
    expect(graph.adj(1)).to eq([])
  end


  context 'when edge is added' do
    let(:edge) { Algorithms::DataStructures::Graphs::DirectedEdge.new(0, 1, 100) }

    before { graph.add(edge) }

    its(:vertices_number) { is_expected.to eq(2) }
    its(:edges_number) { is_expected.to eq(1) }
    its(:vertices) { is_expected.to match_array([0, 1]) }

    it 'returns added edge as adjusted' do
      expect(graph.adj(0)).to eq([edge])
      expect(graph.adj(1)).to eq([])
    end
  end

  context 'when non zero based edge is added' do
    let(:edge) { Algorithms::DataStructures::Graphs::DirectedEdge.new(1, 2, 100) }

    before { graph.add(edge) }

    its(:vertices_number) { is_expected.to eq(2) }
    its(:edges_number) { is_expected.to eq(1) }
    its(:vertices) { is_expected.to match_array([1, 2]) }

    it 'returns added edge as adjusted' do
      expect(graph.adj(1)).to eq([edge])
      expect(graph.adj(2)).to eq([])
    end
  end

  describe 'edges' do
    let(:edge) { Algorithms::DataStructures::Graphs::DirectedEdge.new(0, 1, 100) }

    subject { graph.edges }

    before { graph.add(edge) }

    it { is_expected.to match_array([edge]) }
  end
end
