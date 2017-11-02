module DataStructures
  module SymbolTables
    module Decorators
      class Printable < SimpleDelegator
        attr_reader :value_width

        def initialize(node, value_width = 2)
          super(WithStats.new(node))

          @value_width = value_width
        end

        def to_s
          fill_map(__getobj__, 0, 0, width)

          map.collect(&:join).join('\n')
        end

        private

        def fill_map(node, top, left, width)
          map[top][left + width / 2] = node&.value.to_s.center(value_width)

          fill_map(node.left, top + 1, left, width / 2) if node.left
          fill_map(node.right, top + 1, left + width / 2 + 1, width / 2) if node.right
        end

        def map
          @map ||= Array.new(height + 1) { Array.new(width, " " * value_width) }
        end

        def width
          @width = 2 * 2**height - 1
        end
      end
    end
  end
end
