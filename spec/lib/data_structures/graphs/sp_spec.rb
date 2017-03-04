require_relative '../../../../lib/data_structures/graphs/sp'
require_relative '../../../../lib/data_structures/graphs/directed_edge'

RSpec.describe Algorithms::DataStructures::Graphs::SP do
  let(:s) { 0 }

  subject(:sp) { described_class.new(s) }

  describe '#distance_to' do
    subject { sp.distance_to(v) }

    context 'source' do
      let(:v) { s }

      it { is_expected.to be_zero }
    end

    context 'when 1 edge is relaxed' do
      let(:v) { 1 }

      before do
        sp.relax(Algorithms::DataStructures::Graphs::DirectedEdge.new(s, v, 100))
      end

      it { is_expected.to eq(100) }
    end

    context 'when 2 edges are relaxed' do
      let(:w) { 1 }
      let(:v) { 2 }

      before do
        sp.relax(Algorithms::DataStructures::Graphs::DirectedEdge.new(s, w, 100))
        sp.relax(Algorithms::DataStructures::Graphs::DirectedEdge.new(w, v, 50))
      end

      it { is_expected.to eq(150) }
    end

    context 'when there is no path to the specified vertex' do
      let(:v) { 2 }

      it 'raises and error' do
        expect{ subject }.to raise_error(described_class::Error)
      end
    end
  end

  describe '#path_to' do
    subject { sp.path_to(v) }

    context 'source' do
      let(:v) { s }

      it { is_expected.to eq([s]) }
    end

    context 'when 1 edge is relaxed' do
      let(:v) { 1 }

      before do
        sp.relax(Algorithms::DataStructures::Graphs::DirectedEdge.new(s, v, 100))
      end

      it { is_expected.to eq([0, 1]) }
    end

    context 'when 2 edges are relaxed' do
      let(:w) { 1 }
      let(:v) { 2 }

      before do
        sp.relax(Algorithms::DataStructures::Graphs::DirectedEdge.new(s, w, 100))
        sp.relax(Algorithms::DataStructures::Graphs::DirectedEdge.new(w, v, 50))
      end

      it { is_expected.to eq([0, 1, 2]) }
    end

    context 'when there is no path to the specified vertex' do
      let(:v) { 2 }

      it 'raises and error' do
        expect{ subject }.to raise_error(described_class::Error)
      end
    end
  end
end
