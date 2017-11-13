module Algorithms
  module Custom
    class ReversePairs < Struct.new(:arr)
      class AvlTree
        class NullNode
          attr_reader :left, :right, :value

          def height; 0 end
          def count(_); 0 end
          def size; 0 end
          def put(value); Node.new(value) end
          def nil?; true end
        end
        NULL = NullNode.new.freeze

        class Node
          attr_reader :value
          attr_accessor :left, :right

          def initialize value
            @value = value
            @left = @right = NULL
            @height = 1
            @counter = 1
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
            @size ||= @counter + left.size + right.size
          end

          def left=(left_node)
            updated!
            @left = left_node
          end

          def right=(right_node)
            updated!
            @right = right_node
          end

          def put(new_value)
            if value > new_value
              self.left = left.put(new_value)
            elsif value < new_value
              self.right = right.put(new_value)
            else
              @counter += 1
              @size = nil
            end

            balance!
          end

          def count(k)
            res = 0

            if value > k
              res += @counter
              res += right.size if right
              res += left.count(k) if left
            elsif right
              res += right.count(k)
            end

            return res
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

        def put(value)
          @root = @root.put(value)
        end

        def to_s
          Decorators::Printable.new(@root).to_s
        end

        def size
          @root&.size || 0
        end

        def count(k)
          @root&.count(k) || 0
        end
      end

      def execute
        return 0 unless arr

        arr.inject(0) do |res, value|
          res += tree.count(2 * value)
          tree.put(value)
          res
        end
      end

      private

      def tree
        @tree ||= AvlTree.new
      end
    end
  end
end
