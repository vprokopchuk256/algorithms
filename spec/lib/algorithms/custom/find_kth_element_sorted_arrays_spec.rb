require 'spec_helper'

RSpec.describe Algorithms::Custom::FindKthElementSortedArrays do
  let(:a1) { [] }
  let(:a2) { [] }

  subject(:algorithm) { described_class.new(a1, a2).execute }

  def self.test(desc, a1, a2, min: 0, max: a1.length + a2.length)
    describe "#{desc}: #{a1} & #{a2}" do
      let(:algorithm) { described_class.new(a1, a2) }

      (a1 + a2).sort.each_with_index do |value, index|
        next unless (min..max).include?(index)

        it "returns #{value} at position #{index}" do
          expect(algorithm.execute(index)).to eq(value)
        end
      end
    end
  end

  test('ex1', [1], [2])
  test('ex2', [1], [2, 3])
  test('ex3', [1, 3], [2, 4])
  test('ex4', [1, 2], [3, 4])
  test('ex5', [1, 2, 3], [3, 4, 5])
  test('ex6', [1, 4], [2, 3])
  test('ex7', [1, 3], [2])
  test('ex7', [], [2])
end

