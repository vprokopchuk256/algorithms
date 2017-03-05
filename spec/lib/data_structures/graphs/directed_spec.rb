require 'rspec/its'

require_relative '../../../../lib/data_structures/graphs/directed.rb'

RSpec.describe DataStructures::Graphs::Directed do
  subject(:graph) { described_class.new() }

  its(:vertices_number) { is_expected.to be_zero }
  its(:edges_number) { is_expected.to be_zero }

  it 'has all vertices not adjusted' do
    expect(subject.adj(0)).to be_empty
  end

  context 'when one edge defined' do
    before { graph.add_edge(0, 1) }

    its(:vertices_number) { is_expected.to eq(2) }
    its(:edges_number) { is_expected.to eq(1) }

    its(:vertices) { is_expected.to match_array([0, 1]) }

    it 'has both vertices adjusted' do
      expect(subject.adj(0)).to eq([1])
    end
  end

  context 'when one non zero based edge defined' do
    before { graph.add_edge(2, 1) }

    its(:vertices_number) { is_expected.to eq(2) }
    its(:edges_number) { is_expected.to eq(1) }

    its(:vertices) { is_expected.to match_array([2, 1]) }

    it 'has both vertices adjusted' do
      expect(subject.adj(2)).to eq([1])
    end
  end

  context 'with tre edges loop' do
    before do
      graph.add_edge(0, 1)
      graph.add_edge(1, 2)
      graph.add_edge(0, 2)
    end

    its(:vertices_number) { is_expected.to eq(3) }
    its(:edges_number) { is_expected.to eq(3) }

    its(:vertices) { is_expected.to match_array([0, 1, 2]) }

    it 'has all vertices adjusted' do
      expect(subject.adj(0)).to eq([1, 2])
      expect(subject.adj(1)).to eq([2])
      expect(subject.adj(2)).to eq([])
    end
  end
end


