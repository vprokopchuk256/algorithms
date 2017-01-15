require_relative './base_merge'

module Algorithms
  module Sorting
    class Merge < BaseMerge
      protected

      def sort(from = 0, to = arr.length - 1)
        return if to <= from

        if to == from + 1
          arr[from], arr[to] = arr[to], arr[from] if arr[to] < arr[from]
          return
        end

        mid = from + (to - from) / 2

        sort(from, mid)
        sort(mid + 1, to)

        merge(from, mid, mid + 1, to)
      end
    end
  end
end
