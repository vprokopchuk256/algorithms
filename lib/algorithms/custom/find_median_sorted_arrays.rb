require_relative 'find_kth_element_sorted_arrays'

module Algorithms
  module Custom
    class FindMedianSortedArrays < Struct.new(:a1, :a2)
      def execute
        return if a1.nil? || a2.nil? || (a1.empty? && a2.empty?)

        total = a1.length + a2.length
        mi = total >> 1

        total.odd? ? kth(mi) : (kth(mi - 1) + kth(mi)).to_f / 2
      end

      private

      def kth(k)
        kth_calculator.execute(k)
      end

      def kth_calculator
        @kth_calculator ||= FindKthElementSortedArrays.new(a1, a2)
      end
    end
  end
end
