require_relative '../../../lib/union_find/quick_union.rb'

RSpec.describe UnionFind::QuickUnion do
  let(:number_of_items) { 10 }

  subject(:quick_find) { described_class.new(number_of_items) }

  describe '#connected?' do
    subject { quick_find.connected?(1, 3) }

    it { is_expected.to be_falsey }

    context 'when two items are connected directly' do
      before { quick_find.union(1, 3) }

      it { is_expected.to be_truthy }
    end

    context 'when two items are connected through third one' do
      before do
        quick_find.union(1, 2)
        quick_find.union(2, 3)
      end

      it { is_expected.to be_truthy }
    end
  end
end
