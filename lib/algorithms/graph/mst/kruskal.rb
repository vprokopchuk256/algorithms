require_relative 'base'
require_relative '../../../algorithms/union_find/quick_find'

module Algorithms
  module Graph
    module MST
      class Kruskal < Base
        def each
          return enum_for(:each) unless block_given?

          pq = Algorithms::DataStructures::PriorityQueues::Min.new
          graph.edges.each(&pq.method(:insert))

          uf = Algorithms::UnionFind::QuickFind.new(graph.size)

          mst_size = 0

          while !pq.empty? && mst_size < graph.size
            edge = pq.del_min
            v = edge.either
            w = edge.other(v)

            if !uf.connected?(v, w)
              mst_size = mst_size + 1
              uf.union(v, w)
              yield edge
            end
          end
        end
      end
    end
  end
end
