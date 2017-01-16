module Algorithms
  module Utils
    module Partition
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
