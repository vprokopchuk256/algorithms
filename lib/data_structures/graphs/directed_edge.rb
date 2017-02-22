module Algorithms
  module DataStructures
    module Graphs
      class DirectedEdge < Struct.new(:from, :to, :weight)
        include Comparable

        def <=> vertex
          weight <=> vertex.weight
        end
      end
    end
  end
end
