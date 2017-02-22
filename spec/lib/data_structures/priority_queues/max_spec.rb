require 'ostruct'

require_relative '../../../../lib/data_structures/priority_queues/max.rb'

RSpec.describe Algorithms::DataStructures::PriorityQueues::Max do
  let(:property) { :itself }
  subject(:queue) { described_class.new(property) }

  it { is_expected.to be_empty }

  it 'does not have max element yet' do
    expect(queue.del_max).to eq(nil)
  end

  context 'when 1 element is added' do
    before { queue.insert(2) }

    it { is_expected.not_to be_empty }

    describe 'del_max' do
      subject { queue.del_max }

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

    describe 'del_max' do
      it 'equals to that element' do
        expect(queue.del_max).to eq(3)
        expect(queue.del_max).to eq(2)
        expect(queue.del_max).to eq(1)
      end
    end
  end

  context 'when 9 elements with property were added' do
    let(:el1) { OpenStruct.new(weight: 1) }
    let(:el2) { OpenStruct.new(weight: 2) }
    let(:el3) { OpenStruct.new(weight: 3) }
    let(:el4) { OpenStruct.new(weight: 4) }
    let(:el5) { OpenStruct.new(weight: 5) }
    let(:el6) { OpenStruct.new(weight: 6) }
    let(:el7) { OpenStruct.new(weight: 7) }
    let(:el8) { OpenStruct.new(weight: 8) }
    let(:el9) { OpenStruct.new(weight: 9) }
    let(:property) { :weight }

    before do
      queue.insert(el1)
      queue.insert(el2)
      queue.insert(el3)
      queue.insert(el4)
      queue.insert(el5)
      queue.insert(el6)
      queue.insert(el7)
      queue.insert(el8)
      queue.insert(el9)
    end

    describe 'del_max' do
      it 'equals to that element' do
        expect(queue.del_max).to eq(el9)
        expect(queue.del_max).to eq(el8)
        expect(queue.del_max).to eq(el7)
        expect(queue.del_max).to eq(el6)
        expect(queue.del_max).to eq(el5)
        expect(queue.del_max).to eq(el4)
        expect(queue.del_max).to eq(el3)
        expect(queue.del_max).to eq(el2)
        expect(queue.del_max).to eq(el1)
      end
    end
  end
end
