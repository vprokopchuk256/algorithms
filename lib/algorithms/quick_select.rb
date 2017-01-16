require_relative 'utils/swap'

module Algorithms
  class QuickSelect
    include Utils::Swap

    attr_reader :arr

    def initialize(arr)
      @arr = arr
    end

    def max(k)
      lo, hi = 0, arr.length - 1

      while hi > lo
        j = partition(lo, hi)

        lo = j + 1 if j < k
        hi = j - 1 if j > k

        return arr[j] if j == k
      end

      arr[k]
    end

    private

    def partition(left, right)
      i, j = left, right

      loop do
        i += 1 while arr[i] < arr[left] && i != right
        j -= 1 while arr[left] < arr[j] && j != left
        break if i >= j

        swap(i, j)
      end

      swap(left, j)
      j
    end
  end
end
