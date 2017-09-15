module Algorithms
  module Custom
    class LRUCache
      Node = Struct.new(:key, :value, :left, :right)

      attr_reader :capacity

      def initialize(capacity)
        @capacity = capacity
      end

      def put(key, value)
        unless node = get_node(key)
          evict_node if hash_table.size == capacity

          node = Node.new(key)
          add_item_node(node)
          hash_table[key] = node
        end

        node.value = value
      end

      def get(key)
        node = get_node(key)

        node ? node.value : -1
      end

      private

      def get_node(key)
        node = hash_table[key]

        return unless node

        if node != @head
          node.right.left = node.left

          if node.left
            node.left.right = node.right
          end

          @tail = node.right if node == @tail

          node.right = nil
          @head.right = node
          node.left = @head
          @head = node
        end

        node
      end

      def add_item_node(node)
        if hash_table.empty?
          @head = node
          @tail = node
          return
        end

        @head.right = node
        node.left = @head
        @head = node
      end

      def evict_node
        if hash_table.size == 1
          @head = nil
          @tail = nil
          @hash_table.clear
          return
        end

        hash_table.delete(@tail.key)
        @tail = @tail.right
        @tail.left = nil
      end

      def hash_table
        @hash_table ||= {}
      end
    end
  end
end
