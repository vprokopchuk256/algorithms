module Algorithms
  module DataStructures
    module Graphs
      class EdgeWeightedDigraph
        attr_reader :map, :edges

        def initialize
          @map = []
          @edges = []
        end

        def adj(vertex)
          @map[vertex] ||= []
        end

        def add(edge)
          @edges.push(edge)
          adj(edge.from).push(edge)
          adj(edge.to)
        end

        def edges_number
          @edges.size
        end

        def vertices_number
          @map.reject(&:nil?).size
        end

        def vertices
          return to_enum(:vertices) unless block_given?

          @map.each_with_index{ |v, i| yield(i) if v }
        end

        def empty?
          @edges.empty?
        end
      end
    end
  end
end
