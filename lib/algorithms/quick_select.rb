require_relative 'utils/swap'
require_relative 'utils/partition'

module Algorithms
  class QuickSelect
    include Utils::Swap
    include Utils::Partition

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
  end
end
