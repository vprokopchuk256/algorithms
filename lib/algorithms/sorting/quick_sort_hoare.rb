require_relative './base'

module Algorithms
  module Sorting
    class QuickSortHoare < Base
      protected

      def sort(left = 0, right = arr.length - 1)
        return if left >= right

        p = partition(left, right)

        sort(left, p)
        sort(p + 1, right)
      end

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
end
