module Algorithms
  module DataStructures
    module Graphs
      class Edge < Struct.new(:v, :w, :weight)
        alias_method :either, :v

        def other(vertex)
          vertex == v ? w : v
        end

        def <=> vertex
          weight <=> vertex.weight
        end
      end
    end
  end
end
