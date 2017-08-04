require 'spec_helper'

RSpec.describe DataStructures::SymbolTables::TST do
  let(:st) { described_class.new }

  describe '#[]' do

    subject { st[key] }

    context 'uc0' do
      let(:key) { 'aa' }

      it { is_expected.to be_nil }
    end

    context 'when keys is added to the table' do
      let(:value) { 2 }

      before { st.put(key, value) }

      context 'uc1' do
        let(:key) { 'a' }

        it { is_expected.to eq(value) }
      end

      context 'and it is longer than 1 symbol' do
        let(:key) { 'some long key' }

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
