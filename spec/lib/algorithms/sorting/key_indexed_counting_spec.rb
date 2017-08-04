require 'spec_helper'

RSpec.describe Algorithms::Sorting::KeyIndexedCounting do
  let(:arr) { [3, 0, 2, 5, 5, 1, 3, 1, 5, 1, 4, 0] }
  let(:algorithm) { described_class.new(arr) }

  describe '#execute' do
    subject { algorithm.execute }

    it { is_expected.to eq([0, 0, 1, 1, 1, 2, 3, 3, 4, 5, 5, 5]) }

    context 'when array contains non integers and conversion defined' do
      let(:arr) { %w[3 0 2 5 5 1 3 1 5 1 4 0] }
      let(:algorithm) { described_class.new(arr, &:to_i) }

      it { is_expected.to eq(%w[0 0 1 1 1 2 3 3 4 5 5 5]) }
    end

    context 'when buffer is specified' do
    end
  end
end
