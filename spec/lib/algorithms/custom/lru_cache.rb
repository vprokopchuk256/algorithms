require 'spec_helper'

RSpec.describe Algorithms::Custom::LRUCache do
  let(:capacity) { 2 }

  subject(:cache) { described_class.new(capacity) }

  describe '#initialize' do
    its(:capacity) { is_expected.to eq(capacity) }
  end

  it 'ex1' do
    cache.put(1, 1)
    cache.put(2, 2)
    expect(cache.get(1)).to eq(1)
    cache.put(3, 3)
    expect(cache.get(2)).to eq(-1)
    cache.put(4, 4);
    expect(cache.get(1)).to eq(-1)
    expect(cache.get(3)).to eq(3)
    expect(cache.get(4)).to eq(4)
  end

  it 'ex2' do
    expect(cache.get(2)).to eq(-1)
    cache.put(2, 6)
    expect(cache.get(1)).to eq(-1)
    cache.put(1, 5)
    cache.put(1, 2)
    expect(cache.get(1)).to eq(2)
    expect(cache.get(2)).to eq(6)
  end

  context 'when capacity == 3' do
    let(:capacity) { 3 }

    it 'ex3' do
      cache.put(1, 1)
      cache.put(2, 2)
      cache.put(3, 3)
      cache.put(4, 4)
      expect(cache.get(4)).to eq(4)
      expect(cache.get(3)).to eq(3)
      expect(cache.get(2)).to eq(2)
      expect(cache.get(1)).to eq(-1)
      cache.put(5, 5)
      expect(cache.get(1)).to eq(-1)
      expect(cache.get(2)).to eq(2)
      expect(cache.get(3)).to eq(3)
      expect(cache.get(4)).to eq(-1)
      expect(cache.get(5)).to eq(5)
    end
  end
end
