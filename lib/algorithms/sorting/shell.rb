require_relative './base'

module Algorithms
  module Sorting
    class Shell < Base
      protected

      def sort
        h = initial_h

        while h >= 1 do
          subsort(h)
          h = (h.to_f / 3).round
        end
      end

      private

      def subsort(h)
        0.step(arr.length - 1) do |i|
          i.step(h, -h) do |j|
            break if arr[j] >= arr[j - 1]

            swap(j, j - 1)
          end
        end
      end

      def initial_h
        h = 1
        h = 3 * h + 1 while h < arr.length.to_f / 3
        h
      end

      def swap(i, j)
        arr[j], arr[i] = arr[i], arr[j]
      end
    end
  end
end
