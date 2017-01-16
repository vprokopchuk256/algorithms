require_relative './base'
require_relative '../utils/partition'

module Algorithms
  module Sorting
    class QuickSortHoare < Base
      include Utils::Partition

      protected

      def sort(left = 0, right = arr.length - 1)
        return if left >= right

        p = partition(left, right)

        sort(left, p)
        sort(p + 1, right)
      end
    end
  end
end
