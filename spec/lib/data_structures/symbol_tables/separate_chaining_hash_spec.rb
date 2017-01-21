require_relative '../../../../lib/data_structures/symbol_tables/separate_chaining_hash.rb'

RSpec.describe Algorithms::DataStructures::SymbolTables::SeparateChainingHash do
  subject(:table) { described_class.new }

  it 'returns nil for non existing key' do
    expect(table.get('k')).to be_nil
  end

  context 'with one element' do
    before { table.put('k', 5) }

    it 'returns key value' do
      expect(table.get('k')).to eq(5)
    end
  end

  context 'with two elements' do
    before do
      table.put('k', 5)
      table.put('l', 6)
    end

    it 'returns key value' do
      expect(table.get('k')).to eq(5)
      expect(table.get('l')).to eq(6)
    end

    it 'returns nil for non existing key' do
      expect(table.get('m')).to be_nil
    end
  end

  context 'with three elements' do
    before do
      table.put('k', 5)
      table.put('l', 6)
      table.put('m', 7)
    end

    it 'returns key value' do
      expect(table.get('k')).to eq(5)
      expect(table.get('l')).to eq(6)
      expect(table.get('m')).to eq(7)
    end
  end
end
