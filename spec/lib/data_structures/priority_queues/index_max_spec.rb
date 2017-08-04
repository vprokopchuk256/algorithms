require 'spec_helper'

RSpec.describe Algorithms::DataStructures::PriorityQueues::IndexMax do
  let(:property) { :itself }

  subject(:queue) { described_class.new(property) }

  it { is_expected.to be_empty }

  it 'does not have max element yet' do
    expect(queue.del_max).to eq(nil)
  end

  context 'when 1 element is added' do
    before { queue.insert(1, 1) }

    it { is_expected.not_to be_empty }

    describe 'del_max' do
      subject { queue.del_max }

      it 'equals to that element' do
        expect(subject).to eq(1)
      end

      it 'returns queue to the empty state' do
        expect{ subject }.to change{ queue.empty? }.to(true)
      end
    end
  end

  context 'when element key is updated' do
    before do
      queue.insert(1, 1)
      queue.insert(2, 2)
      queue.insert(3, 3)
      queue.insert(4, 4)
      queue.insert(5, 5)
      queue.insert(6, 6)
      queue.insert(7, 7)
      queue.insert(8, 8)
      queue.insert(9, 9)
    end

    before do
      queue.change_key(9, 1)
      queue.change_key(1, 9)
    end

    describe 'del_max' do
      it 'equals to that element' do
        expect(queue.del_max).to eq(1)
        expect(queue.del_max).to eq(8)
        expect(queue.del_max).to eq(7)
        expect(queue.del_max).to eq(6)
        expect(queue.del_max).to eq(5)
        expect(queue.del_max).to eq(4)
        expect(queue.del_max).to eq(3)
        expect(queue.del_max).to eq(2)
        expect(queue.del_max).to eq(9)
      end
    end
  end

  context 'when element key is decreased' do
    before do
      queue.insert(1, 1)
      queue.insert(2, 2)
      queue.insert(3, 3)
      queue.insert(4, 4)
      queue.insert(5, 5)
      queue.insert(6, 6)
      queue.insert(7, 7)
      queue.insert(8, 8)
      queue.insert(9, 9)
    end

    before do
      queue.decrease_key(9, 0)
    end

    describe 'del_max' do
      it 'equals to that element' do
        expect(queue.del_max).to eq(8)
        expect(queue.del_max).to eq(7)
        expect(queue.del_max).to eq(6)
        expect(queue.del_max).to eq(5)
        expect(queue.del_max).to eq(4)
        expect(queue.del_max).to eq(3)
        expect(queue.del_max).to eq(2)
        expect(queue.del_max).to eq(1)
        expect(queue.del_max).to eq(9)
      end
    end
  end

  context 'when element key is increased' do
    before do
      queue.insert(1, 1)
      queue.insert(2, 2)
      queue.insert(3, 3)
      queue.insert(4, 4)
      queue.insert(5, 5)
      queue.insert(6, 6)
      queue.insert(7, 7)
      queue.insert(8, 8)
      queue.insert(9, 9)
    end

    before do
      queue.increase_key(1, 10)
    end

    describe 'del_max' do
      it 'equals to that element' do
        expect(queue.del_max).to eq(1)
        expect(queue.del_max).to eq(9)
        expect(queue.del_max).to eq(8)
        expect(queue.del_max).to eq(7)
        expect(queue.del_max).to eq(6)
        expect(queue.del_max).to eq(5)
        expect(queue.del_max).to eq(4)
        expect(queue.del_max).to eq(3)
        expect(queue.del_max).to eq(2)
      end
    end
  end

  context 'when 9 elements were added' do
    before do
      queue.insert(1, 1)
      queue.insert(2, 2)
      queue.insert(3, 3)
      queue.insert(4, 4)
      queue.insert(5, 5)
      queue.insert(6, 6)
      queue.insert(7, 7)
      queue.insert(8, 8)
      queue.insert(9, 9)
    end

    describe 'del_max' do
      it 'equals to that element' do
        expect(queue.del_max).to eq(9)
        expect(queue.del_max).to eq(8)
        expect(queue.del_max).to eq(7)
        expect(queue.del_max).to eq(6)
        expect(queue.del_max).to eq(5)
        expect(queue.del_max).to eq(4)
        expect(queue.del_max).to eq(3)
        expect(queue.del_max).to eq(2)
        expect(queue.del_max).to eq(1)
      end
    end
  end

  context 'when 9 elements with property were added' do
    let(:property) { :itself }

    let(:el1) { OpenStruct.new(weight: 1) }
    let(:el2) { OpenStruct.new(weight: 2) }
    let(:el3) { OpenStruct.new(weight: 3) }
    let(:el4) { OpenStruct.new(weight: 4) }
    let(:el5) { OpenStruct.new(weight: 5) }
    let(:el6) { OpenStruct.new(weight: 6) }
    let(:el7) { OpenStruct.new(weight: 7) }
    let(:el8) { OpenStruct.new(weight: 8) }
    let(:el9) { OpenStruct.new(weight: 9) }

    before do
      queue.insert(el9, 9)
      queue.insert(el8, 8)
      queue.insert(el7, 7)
      queue.insert(el6, 6)
      queue.insert(el5, 5)
      queue.insert(el4, 4)
      queue.insert(el3, 3)
      queue.insert(el2, 2)
      queue.insert(el1, 1)
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
