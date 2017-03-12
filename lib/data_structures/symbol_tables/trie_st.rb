module DataStructures
  module SymbolTables
    class TrieST
      R = 256

      Error = Class.new(StandardError)

      class Node
        def put(key, value, d = 0)
          @value = value and return unless key[d]

          (next_nodes[key[d].ord] ||= Node.new).put(key, value, d + 1)
        end

        def get(key, d = 0)
          return @value unless key[d]
          return unless node = next_nodes[key[d].ord]

          node.get(key, d + 1)
        end

        private

        def next_nodes
          @next_nodex ||= Array.new(R)
        end
      end
      private_constant :Node


      def get(key)
        root.get(key)
      end
      alias_method :[], :get

      def contains?(key)
        !!get(key)
      end

      def put(key, value)
        raise Error unless key

        root.put(key, value)
      end

      private

      def root
        @root ||= Node.new
      end
    end
  end
end
