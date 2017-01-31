module Algorithms
  module Graph
    class DepthFirstPaths
      include Enumerable

      class EnumerationBlock
        attr_reader :graph, :block

        def initialize graph, &block
          @graph = graph
          @block = block
        end

        def visit(v)
          return if visited?(v)

          mark_as_visited(v)
          block.call(v)

          graph.adj(v).each(&method(:visit))
        end

        private

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

        EnumerationBlock.new(graph, &block).visit(from)
      end
    end
  end
end
