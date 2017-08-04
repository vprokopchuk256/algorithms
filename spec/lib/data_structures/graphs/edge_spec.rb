require 'spec_helper'

RSpec.describe Algorithms::DataStructures::Graphs::Edge do
  let(:w) { 10 }
  let(:v) { 7 }
  let(:weight) { 120 }

  let(:edge) { described_class.new(v, w, weight) }

  describe '#either' do
    subject { edge.either }

    it 'returns first as either' do
      expect(subject).to eq(v)
    end
  end

  describe '#other' do
    let(:vertex) { w }

    subject { edge.other(vertex) }

    it 'returns v' do
      expect(subject).to eq(v)
    end

    context 'when oter vertex specified' do
      let(:vertex) { v }

      it 'returns w' do
        expect(subject).to eq(w)
      end
    end
  end

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
