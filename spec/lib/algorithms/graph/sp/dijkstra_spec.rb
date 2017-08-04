require 'spec_helper'

RSpec.describe Algorithms::Graph::SP::Dijkstra do
  let(:s) { 0 }
  let(:graph) { Algorithms::DataStructures::Graphs::EdgeWeightedDigraph.new }

  subject(:algorithm) { described_class.new(s, graph) }

  describe '#initialize' do
    its(:s) { is_expected.to eq(s) }
    its(:graph) { is_expected.to eq(graph) }
  end

  describe '#execute' do
    subject(:sp) { algorithm.execute }

    it 'raises an error on empty graph' do
      expect{ subject }.to raise_error(described_class::Error)
    end

    context 'when graph is not empty' do
      context 'and there is one edge' do
        before do
          graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(s, 1, 100))
        end

        it 'returns correct sp object' do
          expect(sp.path_to(1)).to eq([0, 1])
        end
      end

      context 'and there are 2 edges' do
        before do
          graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(s, 1, 100))
          graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(1, 2, 100))
        end

        it 'returns correct sp object' do
          expect(sp.path_to(2)).to eq([0, 1, 2])
        end
      end

      context 'and there are 2 alternative paths' do
        before do
          graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(s, 1, 100))
          graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(1, 2, 100))

          graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(s, 3, 50))
          graph.add(Algorithms::DataStructures::Graphs::DirectedEdge.new(3, 2, 50))
        end

        it 'returns correct sp object' do
          expect(sp.path_to(2)).to eq([0, 3, 2])
        end
      end
    end
  end
end
