require_relative '../../../../lib/algorithms/search/binary.rb'

RSpec.describe Algorithms::Search::Binary do
  describe '#index_of' do
    let(:arr) { [] }

    subject { described_class.new(arr).index_of(3) }

    it { is_expected.to eq(-1) }

    context 'when array has only element that is being searched' do
      let(:arr) { [3] }

      it { is_expected.to be_zero }
    end

    context 'when array even number elements and one of the is being searched' do
      let(:arr) { [2, 3] }

      it { is_expected.to eq(1) }
    end

    context 'when array odd number of elements elements and one of the is being searched' do
      let(:arr) { [2, 3, 4] }

      it { is_expected.to eq(1) }
    end
  end
end
