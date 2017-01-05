module Algorithms
  module UnionFind
    class Base
      attr_reader :items

      def initialize(number_of_items)
        @items = Array.new(number_of_items, &:itself)
      end
    end
  end
end
