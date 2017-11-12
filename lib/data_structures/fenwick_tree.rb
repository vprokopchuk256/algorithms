module Algorithms
  module DataStructures
    class FenwickTree
      attr_reader :length

      def initialize(length)
        @length = length
      end

      def to_a
        values
      end

      def inc(pos, value)
        while pos <= length do
          values[pos] += value
          pos += nxt(pos)
        end
      end

      def sum
        res = 0

        i = length

        while i > 0
          res += values[i]
          i -= nxt(i)
        end

        return res
      end

      private

      def values
        @values ||= Array.new(length + 1, 0)
      end

      def nxt(i)
        i & -i
      end
    end
  end
end
