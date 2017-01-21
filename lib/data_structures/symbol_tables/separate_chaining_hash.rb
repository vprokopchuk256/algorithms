module Algorithms
  module DataStructures
    module SymbolTables
      class SeparateChainingHash
        M = 97

        Node = Class.new(Struct.new(:key, :value, :next))
        private_constant :Node

        def put(key, value)
          i = hash(key)

          node = arr[i]

          while node
            node.value = value if node.key == key
            node = node.next
          end

          arr[i] = Node.new(key, value, arr[i])
        end

        def get(key)
          i = hash(key)

          node = arr[i]

          while node
            return node.value if node.key == key
            node = node.next
          end

          nil
        end

        private

        def arr
          @arr ||= Array.new(M)
        end

        def hash(key)
          (key.hash && 0x7fffffff) % M
        end
      end
    end
  end
end
