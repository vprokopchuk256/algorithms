module Algorithms
  module Sorting
    class Base < Struct.new(:arr)
      def execute
        sort
        arr
      end

      protected

      def swap(i, j)
        arr[j], arr[i] = arr[i], arr[j]
      end
    end
  end
end
