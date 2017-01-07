require_relative './base'

module Algorithms
  module Sorting
    class Selection < Base
      protected

      def sort
        each_index { |i| swap(min_value_index(from: i), i) }
      end

      private

      def each_index(from: 0, &block)
        from.step(to: arr.length - 1, &block)
      end

      def min_value_index(from:)
        each_index(from: from + 1).inject(from) { |m, j| arr[j] < arr[m] ? j : m }
      end

      def swap(i, j)
        arr[j], arr[i] = arr[i], arr[j]
      end
    end
  end
end
