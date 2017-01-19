module Algorithms
  module DataStructures
    module SymbolTables
      class BinarySearchTree
        Node = Class.new(Struct.new(:key, :value, :left, :right))
        private_constant :Node

        def initialize
        end

        def put(key, value)
          @root = put_node(@root, key, value)
        end

        def empty?
          @root.nil?
        end

        def delete(key)
          delete_node(@root, key)
        end

        def get(key)
          node = @root

          while node
            cmp = key <=> node.key

            node = node.left if cmp < 0
            node = node.right if cmp > 0
            return node.value if cmp == 0
          end

          nil
        end

        private

        def put_node(node, key, value)
          return Node.new(key, value) unless node

          cmp = key <=> node.key

          node.tap do |node|
            node.left = put_node(node.left, key, value) if cmp < 0
            node.right = put_node(node.right, key, value) if cmp > 0
            node.value = value if cmp == 0
          end
        end

        def delete_node(node, key)
          return unless node

          cmp = key <=> node.key

          if cmp < 0
            node.left = delete_node(node.left, key)
          elsif cmp > 0
            node.right = delete_node(node.right, key)
          else
            return node.left unless node.right

            n = node

            node = min_node(n.right)
            node.right = delete_min(n.right)
            node.left = n.left
          end

          node
        end

        def delete_min(node)
          return node.right unless node.left

          node.left = delete_min(node.left)

          node
        end

        def min_node(node)
          return node unless node.left

          min_node(node)
        end
      end
    end
  end
end
