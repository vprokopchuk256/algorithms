require_relative '../../../../lib/data_structures/graphs/indirected.rb'

RSpec.describe DataStructures::Graphs::Indirected do

  subject(:graph) { described_class.new(vertices_number) }

  context 'when initialized with zero' do
    let(:vertices_number) { 0 }

    it 'raises an error' do
      expect{ subject }.to raise_error(ArgumentError, /number of vertices must be greater than 1/)
    end
  end

  context 'when initialized with 2 verticies' do
    let(:vertices_number) { 2 }

    it 'must have valid vertices number' do
      expect(subject.vertices_number).to eq(vertices_number)
    end

    it 'has zero edges' do
      expect(subject.edges_number).to be_zero
    end

    it 'has all vertices not adjusted' do
      expect(subject.adj(0)).to be_empty
    end

    it 'has all vertices having zero degree' do
      expect(subject.degree(0)).to be_zero
    end

    it 'has zero max degree' do
      expect(subject.max_degree).to be_zero
    end

    it 'has zero average degree' do
      expect(subject.avg_degree).to be_zero
    end

    context 'and one edge' do
      before { graph.add_edge(0, 1) }

      it 'has zero edges' do
        expect(subject.edges_number).to eq(1)
      end

      it 'has all vertices not adjusted' do
        expect(subject.adj(0)).to eq([1])
      end

      it 'has all vertices having zero degree' do
        expect(subject.degree(0)).to eq(1)
      end

      it 'has zero max degree' do
        expect(subject.max_degree).to eq(1)
      end

      it 'has zero average degree' do
        expect(subject.avg_degree).to eq(1)
      end
    end
  end

  context 'when initialized with 3 verticies with one loop' do
    let(:vertices_number) { 3 }

    it 'must have valid vertices number' do
      expect(subject.vertices_number).to eq(vertices_number)
    end

    context 'and tree edges' do
      before do
        graph.add_edge(0, 1)
        graph.add_edge(1, 2)
        graph.add_edge(0, 2)
      end

      it 'has three edges' do
        expect(subject.edges_number).to eq(3)
      end

      it 'has all vertices adjusted' do
        expect(subject.adj(0)).to eq([1, 2])
        expect(subject.adj(1)).to eq([0, 2])
        expect(subject.adj(2)).to eq([1, 0])
      end

      it 'has all vertices having zero degree' do
        expect(subject.degree(0)).to eq(2)
        expect(subject.degree(1)).to eq(2)
        expect(subject.degree(2)).to eq(2)
      end

      it 'has 2 as max degree' do
        expect(subject.max_degree).to eq(2)
      end

      it 'has 2 as average degree' do
        expect(subject.avg_degree).to eq(2)
      end
    end
  end
end


