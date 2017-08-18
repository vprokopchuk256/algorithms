require_relative '../../data_structures/array_with_default_value'

module Algorithms
  module Custom
    class FindKthElementSortedArrays
      attr_reader :a1, :a2

      def initialize(a1, a2)
        @a1 = DataStructures::ArrayWithDefaultValue.new(a1, default: Float::INFINITY)
        @a2 = DataStructures::ArrayWithDefaultValue.new(a2, default: Float::INFINITY)
      end

      def execute(k)
        kth(k + 1)
      end

      private

      def kth(k, s1: 0, s2: 0)
        return a1[s1] < a2[s2] ? a1[s1] : a2[s2] if k == 1

        k_ = k / 2

        m1, m2 = a1[s1 + k_ - 1], a2[s2 + k_ - 1]

        m2 > m1 ? kth(k - k_, s1: s1 + k_, s2: s2) : kth(k - k_, s1: s1, s2: s2 + k_)
      end
    end
  end
end
