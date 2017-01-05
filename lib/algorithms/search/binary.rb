module Algorithms
  module Search
    class Binary < Struct.new(:arr)
      def index_of(value)
        lo = 0
        hi = arr.length - 1

        while lo <= hi
          mid = lo + (hi - lo) / 2

          return mid if arr[mid] == value

          lo = mid + 1 if arr[mid] < value
          hi = mid - 1 if arr[mid] > value
        end

        -1
      end
    end
  end
end
