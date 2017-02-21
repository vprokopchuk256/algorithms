require_relative '../../../../lib/data_structures/priority_queues/min.rb'

RSpec.describe Algorithms::DataStructures::PriorityQueues::Min do
  subject(:queue) { described_class.new }

  it { is_expected.to be_empty }

  it 'does not have min element yet' do
    expect(queue.del_min).to eq(nil)
  end

  context 'when 1 element is added' do
    before { queue.insert(2) }

    it { is_expected.not_to be_empty }

    describe 'del_min' do
      subject { queue.del_min }

      it 'equals to that element' do
        expect(subject).to eq(2)
      end

      it 'returns queue to the empty state' do
        expect{ subject }.to change{ queue.empty? }.to(true)
      end
    end
  end

  context 'when 3 elements were added' do
    before do
      queue.insert(3)
      queue.insert(1)
      queue.insert(2)
    end

    describe 'del_min' do
      it 'equals to that element' do
        expect(queue.del_min).to eq(1)
        expect(queue.del_min).to eq(2)
        expect(queue.del_min).to eq(3)
      end
    end
  end
end
