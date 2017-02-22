require_relative 'base'

module Algorithms
  module Graph
    module MST
      class LazyPrim < Base
        include Enumerable

        class EnumerationBlock
          attr_reader :graph, :block

          def initialize graph, &block
            @graph = graph
            @block = block
          end

          def start(from)
            visit(0)

            while !pq.empty?
              edge = pq.del_min
              v = edge.either
              w = edge.other(v)

              next if visited?(v) && visited?(w)

              block.call(edge)

              visit(v) if !visited?(v)
              visit(w) if !visited?(w)
            end
          end

          private

          def visit(v)
            mark_as_visited(v)

            graph.adj(v).each do |edge|
              if !visited?(edge.other(v))
                pq.insert(edge)
              end
            end
          end

          def visited_vertices
            @visited_vertices ||= Array.new(graph.size, false)
          end

          def visited?(v)
            visited_vertices[v]
          end

          def mark_as_visited(v)
            visited_vertices[v] = true
          end

          def pq
            @pq ||= Algorithms::DataStructures::PriorityQueues::Min.new
          end
        end
        private_constant :EnumerationBlock

        def each(&block)
          return enum_for(:each) unless block_given?

          EnumerationBlock.new(graph, &block).start(0)
        end
      end
    end
  end
end
