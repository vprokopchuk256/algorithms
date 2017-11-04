module DataStructures
  module SymbolTables
    module Decorators
      class Printable < SimpleDelegator
        attr_reader :value_width

        def initialize(node, value_width = 2)
          super(node)

          @value_width = value_width
        end

        def to_s
          fill_map(__getobj__, 0, 0, width)

          map.collect(&:join).join('\n')
        end

        private

        def fill_map(node, top, left, width)
          return if node.nil?

          map[top][left + width / 2] = node.key.to_s.center(value_width)

          fill_map(node.left, top + 1, left, width / 2)
          fill_map(node.right, top + 1, left + width / 2 + 1, width / 2)
        end

        def map
          @map ||= Array.new(height(self) + 1) { Array.new(width, " " * value_width) }
        end

        def width
          @width = 2 * 2**height(self) - 1
        end

        def height(node)
          return if node.nil?

          leave?(node) ? 0 : 1 + [height(node.left), height(node.right)].compact.max
        end

        def leave?(node)
          node.left.nil? && node.right.nil?
        end
      end
    end
  end
end
