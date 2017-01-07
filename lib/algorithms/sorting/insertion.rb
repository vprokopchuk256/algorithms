require_relative './base'

module Algorithms
  module Sorting
    class Insertion < Base
      protected

      def sort
        0.step(arr.length - 1) do |i|
          i.step(1, -1) do |j|
            break if arr[j] >= arr[j - 1]

            swap(j, j - 1)
          end
        end
      end

      private

      def swap(i, j)
        arr[j], arr[i] = arr[i], arr[j]
      end
    end
  end
end
