module Algorithms
  module DataStructures
    class MaxPriorityQueue
      def initialize
        @arr = [nil]
      end

      def empty?
        @arr.length <= 1
      end

      def del_max
        return nil if empty?
        return @arr.pop if @arr.length == 2

        max = @arr[1]
        @arr[1] = @arr.pop
        sink
        max
      end

      def insert(value)
        @arr.push(value)
        swim
      end

      private

      def swim(k = last_index)
        swap(k / 2, k) while k > 1 && less(k / 2, k)
      end

      def sink(k = 1)
        while 2 * k <= @arr.length - 1
          j = 2 * k
          j += 1 if j < last_index && less(j, j + 1)
          break if not less(k, j)
          swap(k, j)
        end
      end

      def swap(i, j)
        @arr[i], @arr[j] = @arr[j], @arr[i]
      end

      def less(i, j)
        @arr[i] < @arr[j]
      end

      def last_index
        @arr.length - 1
      end
    end
  end
end
