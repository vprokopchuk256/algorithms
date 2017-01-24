require_relative '../../../../lib/data_structures/symbol_tables/binary_search_tree.rb'

RSpec.describe DataStructures::SymbolTables::BinarySearchTree do
  subject(:table) { described_class.new }

  it 'returns nil for non existing key' do
    expect(table.get('k')).to be_nil
  end

  it 'does not raise an exception when non existed key is deleted' do
    expect{ table.delete('k') }.not_to raise_error
  end

  context 'with one element' do
    before { table.put('k', 5) }

    it { is_expected.not_to be_empty }

    it 'returns key value' do
      expect(table.get('k')).to eq(5)
    end

    it 'does nothing when non existing key is deleted' do
      expect{ table.delete('l') }.not_to change(table, :empty?)
    end
  end

  context 'with two elements' do
    before do
      table.put('k', 5)
      table.put('l', 6)
    end

    it { is_expected.not_to be_empty }

    it 'returns key value' do
      expect(table.get('k')).to eq(5)
      expect(table.get('l')).to eq(6)
    end

    it 'returns nil for non existing key' do
      expect(table.get('m')).to be_nil
    end

    it 'deletes only requested key' do
      table.delete('l')

      expect(table.get('k')).to eq(5)
      expect(table.get('l')).to be_nil
    end
  end
end
