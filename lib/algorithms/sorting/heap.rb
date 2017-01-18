require_relative './base'

module Algorithms
  module Sorting
    class Heap < Base
      protected

      def sort
        (arr.length / 2).downto(0, &method(:sink))

        length = arr.length
        while length > 1 do
          swap(0, length - 1)
          sink(0, length -= 1)
        end
      end

      private

      def sink(k, length = arr.length)
        while (j = 2 * k) <= length - 1
          j += 1 if j < length - 1 && arr[j] < arr[j + 1]
          break if not arr[k] < arr[j]
          swap(k, j)
        end
      end
    end
  end
end
