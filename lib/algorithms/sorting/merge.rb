require_relative './base'

module Algorithms
  module Sorting
    class Merge < Base
      protected

      def sort(from = 0, to = arr.length - 1)
        return if to <= from

        if to == from + 1
          arr[from], arr[to] = arr[to], arr[from] if arr[to] < arr[from]
          return
        end

        mid = from + (to - from) / 2

        sort(from, mid)
        sort(mid + 1, to)

        merge(from, mid, mid + 1, to)
      end

      def merge(lfrom, lto, rfrom, rto)
        mpos, lpos, rpos = lfrom, lfrom, rfrom

        while lpos <= lto && rpos <= rto
          if arr[lpos] < arr[rpos]
            mplace[mpos] = arr[lpos]
            lpos += 1
          else
            mplace[mpos] = arr[rpos]
            rpos += 1
          end

          mpos += 1
        end

        (lpos..lto).each { |p| mplace[mpos] = arr[p] && mpos += 1 }
        (rpos..rto).each { |p| mplace[mpos] = arr[p] && mpos += 1 }
        (lfrom..rto).each { |i| arr[i] = mplace[i] }
      end

      def mplace
        @mplace ||= Array.new(arr.length)
      end
    end
  end
end
