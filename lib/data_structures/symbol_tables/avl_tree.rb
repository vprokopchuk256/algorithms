module DataStructures
  module SymbolTables
    class AvlTree
      class NullNode
        attr_reader :left, :right, :key, :value

        def height; 0 end
        def size; 0 end
        def put(key, value); Node.new(key, value) end
        def nil?; true end
      end
      NULL = NullNode.new.freeze

      class Node
        attr_reader :key
        attr_accessor :value, :left, :right

        def initialize key, value = nil
          @key, @value = key, value
          @left = @right = NULL
          @height = 1
        end

        def unbalanced?
          balance_factor > 1
        end

        def left_unbalanced?
          left.height > right.height
        end

        def right_unbalanced?
          right.height > left.height
        end

        def height
          @height ||= (left.height > right.height ? left.height : right.height) + 1
        end

        def size
          @size ||= 1 + left.size + right.size
        end

        def left=(left_node)
          updated!
          @left = left_node
        end

        def right=(right_node)
          updated!
          @right = right_node
        end

        def put(new_key, new_value)
          if key > new_key
            self.left = left.put(new_key, new_value)
          elsif key < new_key
            self.right = right.put(new_key, new_value)
          else
            self.value = new_value
          end

          balance!
        end

        def balance!
          return self unless unbalanced?

          if left_unbalanced?
            self.left = left.rotate_left if left.right_unbalanced?
            rotate_right
          else
            self.right = right.rotate_right if right.left_unbalanced?
            rotate_left
          end
        end

        def rotate_left
          res = right
          self.right = res.left
          res.left = self
          res
        end


        def rotate_right
          res = left
          self.left = res.right
          res.right = self
          res
        end

        private

        def updated!
          @size = nil
          @height = nil
        end

        def balance_factor
          (left.height - right.height).abs
        end
      end

      def initialize
        @root = NULL
      end

      def put(key, value = nil)
        @root = @root.put(key, value)
      end

      def to_s
        Decorators::Printable.new(@root).to_s
      end

      def size
        @root&.size || 0
      end
    end
  end
end
