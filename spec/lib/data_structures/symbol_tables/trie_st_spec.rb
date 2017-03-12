require_relative '../../../../lib/data_structures/symbol_tables/trie_st.rb'

RSpec.describe DataStructures::SymbolTables::TrieST do
  let(:st) { described_class.new }

  describe '#[]' do
    let(:key) { 'a' }

    subject { st[key] }

    it { is_expected.to be_nil }

    context 'when keys is added to the table' do
      let(:value) { 2 }

      before { st.put(key, value) }

      it { is_expected.to eq(value) }

      context 'and it is longer than 1 symbol' do
        let(:key) { 'some long key' }

        it { is_expected.to eq(value) }
      end

      context 'and it is empty' do
        let(:key) { '' }

        it { is_expected.to eq(value) }
      end
    end
  end

  describe '#contains?' do
    let(:key) { 'a' }

    subject { st.contains?(key) }

    it { is_expected.to eq(false) }

    context 'when keys is added to the table' do
      before { st.put(key, 2) }

      it { is_expected.to eq(true) }
    end
  end
end
