require_relative '../../../../lib/data_structures/symbol_tables/binary.rb'

RSpec.describe Algorithms::SymbolTables::Binary do
  subject(:table) { described_class.new }

  it { is_expected.to be_empty }

  it 'returns nil for non existing key' do
    expect(table.get('k')).to be_nil
  end

  context 'with one element' do
    before { table.insert('k', 5) }

    it { is_expected.not_to be_empty }

    it 'returns key value' do
      expect(table.get('k')).to eq(5)
    end
  end

  context 'with two elements' do
    before do
      table.insert('k', 5)
      table.insert('l', 6)
    end

    it { is_expected.not_to be_empty }

    it 'returns key value' do
      expect(table.get('k')).to eq(5)
      expect(table.get('l')).to eq(6)
    end

    it 'returns nil for non existing key' do
      expect(table.get('m')).to be_nil
    end
  end
end
