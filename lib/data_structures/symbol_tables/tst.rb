module DataStructures
  module SymbolTables
    class TST
      Error = Class.new(StandardError)

      class Node
        def initialize(c)
          @c = c
        end

        def put(key, value, d = 0)
          if d == key.length - 1
            @value = value
            return
          end

          c = key[d + 1]

          get_next_node(c) { Node.new(c) }
            .put(key, value, d + 1)
        end

        def get(key, d = 0)
          return @value if d == key.length - 1

          get_next_node(key[d + 1])&.get(key, d + 1)
        end

        private

        def get_next_node(c, &block)
          default = block&.call

          return @mid ||= default if c = @c
          return @left ||= default if c < @c
          return @right ||= default if c > @c
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
        @root ||= Node.new('c')
      end
    end
  end
end
