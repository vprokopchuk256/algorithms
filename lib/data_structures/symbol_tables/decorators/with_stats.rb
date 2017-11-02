module DataStructures
  module SymbolTables
    module Decorators
      class WithStats < SimpleDelegator
        def height
          @height ||= node_height(__getobj__)
        end

        private

        def node_height(node)
          return unless node
          return 0 if !(left = node.left) && !(right = node.right)

          1 + [node_height(node.left), node_height(node.right)].compact.max
        end
      end
    end
  end
end
