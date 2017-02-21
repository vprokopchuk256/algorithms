module Algorithms
  module DataStructures
    module Graphs
      class EdgeWeighted
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
          adj(either = edge.either).push(edge)
          adj(edge.other(either)).push(edge)
        end
      end
    end
  end
end
