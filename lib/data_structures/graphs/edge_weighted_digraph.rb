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
        end

        def empty?
          @edges.empty?
        end
      end
    end
  end
end
