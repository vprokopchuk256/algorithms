module DataStructures
  module Graphs
    class Indirected
      def initialize(vertices_number)
        raise ArgumentError, 'number of vertices must be greater than 1' if vertices_number <= 1

        @vertices_number = vertices_number
        @map = []
      end

      def vertices_number
        @vertices_number ||= 0
      end

      def edges_number
        (@map.reject(&:nil?).collect(&:size).inject(:+) || 0) / 2
      end

      def add_edge(v, w)
        adj(v).push(w)
        adj(w).push(v)
      end

      def adj(v)
        @map[v] ||= []
      end

      def degree(v)
        adj(v).count
      end

      def max_degree
        verticies.collect(&method(:degree)).max
      end

      def avg_degree
        2.0 * edges_number / vertices_number
      end

      private

      def verticies
        0...vertices_number
      end
    end
  end
end
