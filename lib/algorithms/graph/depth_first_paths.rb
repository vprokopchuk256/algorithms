module Algorithms
  module Graph
    class DepthFirstPaths
      include Enumerable

      class EnumerationBlock
        attr_reader :graph, :block, :adj_attribute

        def initialize graph, adj_attribute, &block
          @graph = graph
          @block = block
          @adj_attribute = adj_attribute
        end

        def visit(v)
          return if visited?(v)

          mark_as_visited(v)
          block.call(v)

          graph.adj(v).collect(&adj_attribute).each(&method(:visit))
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

      attr_reader :graph, :from, :adj_attribute

      def initialize(graph, from, adj_attribute: :itself)
        @graph = graph
        @from = from
        @adj_attribute = adj_attribute
      end

      def each(&block)
        return enum_for(:each) unless block_given?

        EnumerationBlock.new(graph, adj_attribute, &block).visit(from)
      end
    end
  end
end
