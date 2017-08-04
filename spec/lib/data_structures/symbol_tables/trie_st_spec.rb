require 'spec_helper'

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

  describe '#keys' do
    let(:prefix) { '' }

    subject do
      st.keys(prefix).to_a
    end

    context 'uc0' do
      it { is_expected.to match_array([]) }
    end

    context 'uc1' do
      before { st.put('aaa', 1) }

      it { is_expected.to match_array(%w[aaa]) }
    end

    context 'uc2' do
      before do
        st.put('aaa', 1)
        st.put('bbb', 2)
      end

      it { is_expected.to match_array(%w[aaa bbb]) }

      context 'uc2.1' do
        let(:prefix) { 'a' }

        it { is_expected.to match_array(%w[aaa]) }
      end
    end

    context 'uc1' do
      before do
        st.put('aa', 1)
        st.put('aaa', 2)
      end

      it { is_expected.to match_array(%w[aa aaa]) }
    end
  end
end
