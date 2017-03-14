module DataStructures
  module SymbolTables
    class TrieST
      R = 256

      Error = Class.new(StandardError)

      class Node
        attr_reader :value

        def put(key, value, d = 0)
          @value = value and return unless key[d]

          (next_nodes[key[d].ord] ||= Node.new).put(key, value, d + 1)
        end

        def get(key, d = 0)
          return self unless key[d]
          return unless node = next_nodes[key[d].ord]

          node.get(key, d + 1)
        end

        def keys(prefix = '', &block)
          block.call(prefix) if @value

          next_nodes.each_with_index do |n, i|
            n&.keys(prefix + i.chr, &block)
          end
        end

        private

        def next_nodes
          @next_nodex ||= Array.new(R)
        end
      end
      private_constant :Node


      def get(key)
        root.get(key)&.value
      end
      alias_method :[], :get

      def contains?(key)
        !!get(key)
      end

      def put(key, value)
        raise Error unless key

        root.put(key, value)
      end

      def keys(prefix = '', &block)
        return to_enum(:keys, prefix) unless block

        root.get(prefix)&.keys(prefix, &block)
      end

      private

      def root
        @root ||= Node.new
      end
    end
  end
end
