require_relative '../../../../lib/algorithms/sorting/selection.rb'

RSpec.describe Algorithms::Sorting::Selection do
  let(:arr) { [] }

  let(:algorithm) { described_class.new(arr) }

  describe '#execute' do
    subject { algorithm.execute }

    it { is_expected.to eq([]) }

    context 'when there is one unsorted item in array' do
      let(:arr) { [1] }

      it { is_expected.to eq(arr) }
    end

    context 'when there are two unsorted items in array' do
      let(:arr) { [2, 1] }

      it { is_expected.to eq([1, 2]) }
    end

    context 'when there are two sorted items in array' do
      let(:arr) { [1, 2] }

      it { is_expected.to eq([1, 2]) }
    end

    context 'when there are three unsorted items in array' do
      let(:arr) { [2, 1, 3] }

      it { is_expected.to eq([1, 2, 3]) }
    end

    context 'when array is reversed' do
      let(:arr) { [3, 2, 1] }

      it { is_expected.to eq([1, 2, 3]) }
    end
  end
end

