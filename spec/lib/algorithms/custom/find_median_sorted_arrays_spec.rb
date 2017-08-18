require 'spec_helper'

RSpec.describe Algorithms::Custom::FindMedianSortedArrays do
  let(:a1) { [] }
  let(:a2) { [] }

  subject(:algorithm) { described_class.new(a1, a2) }

  describe '#initialize' do
    its(:a1) { is_expected.to eq(a1) }
    its(:a2) { is_expected.to eq(a2) }
  end

  describe '#execute' do
    subject { algorithm.execute }

    it { is_expected.to eq(nil) }

    context 'when first array is nil' do
      let(:a1) { nil }
      let(:a2) { [1] }

      it { is_expected.to eq(nil) }
    end

    context 'when second array is nil' do
      let(:a1) { [1] }
      let(:a2) { nil }

      it { is_expected.to eq(nil) }
    end

    context 'when first array is empty and second contains one element' do
      let(:a1) { [] }
      let(:a2) { [4] }

      it { is_expected.to eq(4) }
    end

    context 'when second array is empty and first contains one element' do
      let(:a1) { [1] }
      let(:a2) { [] }

      it { is_expected.to eq(1) }
    end

    context 'when second array is empty and first contains three elements' do
      let(:a1) { [1, 2, 3] }
      let(:a2) { [] }

      it { is_expected.to eq(2) }
    end

    context 'when first array is empty and second contains three elements' do
      let(:a1) { [] }
      let(:a2) { [4, 5, 6] }

      it { is_expected.to eq(5) }
    end

    context 'when second array is empty and first contains two elements' do
      let(:a1) { [1, 2] }
      let(:a2) { [] }

      it { is_expected.to eq(1.5) }
    end

    context 'when first array is empty and second contains two elements' do
      let(:a1) { [] }
      let(:a2) { [4, 5] }

      it { is_expected.to eq(4.5) }
    end

    context 'ex1' do
      let(:a1) { [1, 3] }
      let(:a2) { [2, 4] }

      it { is_expected.to eq(2.5) }
    end

    context 'ex2' do
      let(:a1) { [1, 4] }
      let(:a2) { [2, 3] }

      it { is_expected.to eq(2.5) }
    end

    context 'ex2' do
      let(:a1) { [1, 5] }
      let(:a2) { [2, 3] }

      it { is_expected.to eq(2.5) }
    end

    context 'ex2' do
      let(:a1) { [1, 3] }
      let(:a2) { [2] }

      it { is_expected.to eq(2.0) }
    end

    context 'ex2' do
      let(:a1) { [1, 2] }
      let(:a2) { [3, 4] }

      it { is_expected.to eq(2.5) }
    end
  end
end
