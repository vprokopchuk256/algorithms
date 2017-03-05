require_relative '../../../data_structures/graphs/sp'
require_relative '../depth_first_order'

module Algorithms
  module Graph
    module SP
      class Acyclyc < Struct.new(:s, :graph)
        Error = Class.new(StandardError)

        class ExecuteContext < Struct.new(:s, :graph)

          def execute
            topological.each(&method(:relax))

            sp
          end

          private

          def relax(v)
            graph.adj(v).each(&sp.method(:relax))
          end

          def sp
            @sp ||= DataStructures::Graphs::SP.new(s)
          end

          def topological
            @topological ||= DepthFirstOrder.new(graph, s, adj_attribute: :to)
          end
        end

        def execute
          raise Error if graph.empty?

          ExecuteContext.new(s, graph).execute
        end
      end
    end
  end
end
