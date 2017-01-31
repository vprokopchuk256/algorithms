module DataStructures
  module Graphs
    class Directed
      def initialize(vertices_number)
        raise ArgumentError, 'number of vertices must be greater than 1' if vertices_number <= 1

        @vertices_number = vertices_number
        @map = []
      end

      def vertices_number
        @vertices_number ||= 0
      end

      def edges_number
        @map.reject(&:nil?).collect(&:size).inject(:+) || 0
      end

      def add_edge(v, w)
        adj(v).push(w)
      end

      def adj(v)
        @map[v] ||= []
      end
    end
  end
end
