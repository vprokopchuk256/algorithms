module DataStructures
  module SymbolTables
    class LeftLeaningRedBlackBinarySearchTree
      class RedBlackNode < SimpleDelegator
        attr_accessor :color

        def initialize(node, color)
          super(node)

          @color = color
        end
      end
      private_constant :RedBlackNode

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

      def put(key, value)
        @root = put_node(@root, key, value)
      end

      private

      def red?(node)
        node&.color == :red
      end

      def rotate_left(node)
        x = node.right

        node.right = x.left
        x.left = node
        x.color = node.color
        node.color = :red

        x
      end

      def rotate_right(node)
        x = node.left

        node.left = x.right
        x.right = node
        x.color = node.color
        node.color = :red

        x
      end

      def flip_colors(node)
        node.color = :red
        node.left.color = :black
        node.right.color = :black
      end

      def put_node(node, key, value)
        return RedBlackNode.new(TreeNode.new(key, value), :red) unless node

        cmp = key <=> node.key

        node.left = put_node(node.left, key, value) if cmp < 0
        node.right = put_node(node.right, key, value) if cmp > 0
        node.value = value if cmp == 0

        node = rotate_left(node) if red?(node.right) && !red?(node.left)
        node = rotate_right(node) if red?(node.left) && !red?(node.left.left)
        flip_colors(node) if red?(node.left) && red?(node.right)

        node
      end
    end
  end
end
