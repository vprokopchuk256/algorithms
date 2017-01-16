require_relative './base'

module Algorithms
  module Sorting
    class QuickSort3Way < Base
      def sort(lo = 0, hi = arr.length - 1)
        return if hi <= lo

        lt, gt, i = lo, hi, lo
        v = arr[lo]

        while i <= gt do
          cmp = arr[i] <=> v

          swap(lt, i) and lt += 1 and i += 1 if cmp < 0
          swap(i, gt) and gt -= 1 if cmp > 0
          i += 1 if cmp == 0
        end

        sort(lo, lt - 1)
        sort(gt + 1, hi)
      end
    end
  end
end
