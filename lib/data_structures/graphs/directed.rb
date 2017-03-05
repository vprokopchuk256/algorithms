module DataStructures
  module Graphs
    class Directed
      def initialize
        @map = []
      end

      def vertices_number
        @map.reject(&:nil?).size
      end

      def edges_number
        @map.reject(&:nil?).collect(&:size).inject(:+) || 0
      end

      def add_edge(v, w)
        adj(v).push(w)
        adj(w)
      end

      def adj(v)
        @map[v] ||= []
      end

      def vertices
        return to_enum(:vertices) unless block_given?

        @map.each_with_index{ |v, i| yield(i) if v }
      end
    end
  end
end
