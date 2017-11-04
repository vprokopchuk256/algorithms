module DataStructures
  module SymbolTables
    class TreeNode
      attr_reader :key
      attr_accessor :value, :left, :right

      def initialize key, value = nil
        @key, @value = key, value
      end
    end
  end
end

