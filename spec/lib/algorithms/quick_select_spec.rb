require_relative '../../../lib/algorithms/quick_select.rb'

RSpec.describe Algorithms::QuickSelect do
  let(:arr) { [1, 3, 2] }

  describe 'max' do
    let(:k) { 0 }

    subject { described_class.new(arr).max(k) }

    it { is_expected.to eq(1) }

    context 'max item' do
      let(:k) { 2 }

      it { is_expected.to eq(3) }
    end
  end
end
