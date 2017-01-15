require_relative './base_merge'

module Algorithms
  module Sorting
    class BottomUpMerge < BaseMerge
      protected

      def sort
        sz = 1
        while sz < arr.length do
          0.step(arr.length - sz, sz + sz) do |lo|
            merge(
              lo,
              lo + sz - 1,
              [lo + sz, arr.length - 1].min,
              [lo + sz + sz - 1, arr.length - 1].min
            )
          end
          sz = sz + sz
        end
      end
    end
  end
end
