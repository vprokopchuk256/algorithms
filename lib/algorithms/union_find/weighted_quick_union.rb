require_relative 'base'

module Algorithms
  module UnionFind
    class WeightedQuickUnion < Base
      def initialize(number_of_items)
        super

        @sizes = Array.new(number_of_items, 1)
      end

      def union(p, q)
        i = root(p)
        j = root(q)

        @sizes[i] < @sizes[j] ? connect(i, to: j) : connect(j, to: i)
      end

      def connected?(p, q)
        root(p) == root(q)
      end

      private

      def connect(j, to:)
        items[j] = to
        @sizes[to] += @sizes[j]
      end

      def root(i)
        i = items[i] while items[i] != i
        i
      end
    end
  end
end
