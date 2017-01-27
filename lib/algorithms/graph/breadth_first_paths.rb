module Algorithms
  module Graph
    class BreadthFirstPaths
      include Enumerable

      class EnumerationBlock
        attr_reader :graph, :block

        def initialize graph, &block
          @graph = graph
          @block = block
        end

        def start(from)
          queue.push(from)

          while v = queue.shift do
            next if visited?(v)

            visit(v)
            queue.concat(graph.adj(v))
          end
        end

        private

        def visit(v)
          mark_as_visited(v)
          block.call(v)
        end

        def queue
          @queue ||= []
        end

        def visited_vertices
          @visited_vertices ||= Array.new(graph.vertices_number, false)
        end

        def visited?(v)
          visited_vertices[v]
        end

        def mark_as_visited(v)
          visited_vertices[v] = true
        end
      end
      private_constant :EnumerationBlock

      attr_reader :graph, :from

      def initialize(graph, from)
        @graph = graph
        @from = from
      end

      def each(&block)
        return enum_for(:each) unless block_given?

        EnumerationBlock.new(graph, &block).start(from)
      end
    end
  end
end
