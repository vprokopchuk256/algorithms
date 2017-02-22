module Algorithms
  module DataStructures
    module Graphs
      class EdgeWeightedDigraph
        attr_reader :size, :map, :edges

        def initialize(size)
          @size = size
          @map = Array.new(size)
          @edges = []
        end

        def adj(vertex)
          @map[vertex] ||= []
        end

        def add(edge)
          @edges.push(edge)
          adj(edge.from).push(edge)
        end
      end
    end
  end
end
