module Algorithms
  module DataStructures
    class ArrayWithDefaultValue < SimpleDelegator
      attr_reader :default

      def initialize(arr, default: nil)
        super(arr)

        @default = default
      end

      def at(index)
        super || default
      end

      def [](index)
        super || default
      end
    end
  end
end
