require_relative './base'

module Algorithms
  module Sorting
    class BaseMerge < Base
      protected

      def merge(lfrom, lto, rfrom, rto)
        lpos, rpos = lfrom, rfrom

        lfrom.upto(rto) do |pos|
          if (rpos > rto || arr[lpos] < arr[rpos]) && lpos <= lto
            mplace[pos] = arr[lpos]
            lpos += 1
          elsif lpos > lto || rpos <= rto
            mplace[pos] = arr[rpos]
            rpos += 1
          end
        end

        lfrom.upto(rto) { |pos| arr[pos] = mplace[pos] }
      end

      def mplace
        @mplace ||= Array.new(arr.length)
      end
    end
  end
end
