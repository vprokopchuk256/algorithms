module Algorithms
  module Custom
    class ReversePairsMerge < Struct.new(:arr)
      def execute
        return 0 unless arr && arr.length > 1
        sort_and_count
      end

      private

      def tmp
        @tmp ||= Array.new(arr.length)
      end

      def sort_and_count(from = 0, to = arr.length - 1)
        return 0 unless from < to

        mid = from + ((to - from) >> 1) + 1

        res = 0
        res += sort_and_count(from, mid - 1) + sort_and_count(mid, to) if mid > from
        res + count(from, mid, to).tap { merge(from, mid, to) }
      end

      def count(from, mid, to)
        return 0 if arr[mid - 1] < arr[mid] * 2

        res = 0

        p = p_left = from
        p_right = mid

        while p_left < mid || p_right <= to do
          v_left = get(p_left, mid - 1)
          v_right = get(p_right, to)

          if v_left > v_right * 2
            res += mid - p_left
            p_right += 1
          else
            p_left += 1
          end
        end

        res
      end

      def merge(from, mid, to)
        p = p_left = from
        p_right = mid

        while p_left < mid || p_right <= to do
          v_left = get(p_left, mid - 1)
          v_right = get(p_right, to)

          if v_left == v_right || v_left < v_right
            tmp[p] = v_left
            p_left += 1
            p += 1
          end

          if v_left == v_right || v_left > v_right
            tmp[p] = v_right
            p_right += 1
            p += 1
          end
        end

        (from..to).each { |p| arr[p] = tmp[p] }
      end

      def get(p, to)
        return Float::INFINITY if p > to

        arr[p]
      end
    end
  end
end
