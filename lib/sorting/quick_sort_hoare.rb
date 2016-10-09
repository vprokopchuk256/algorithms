require_relative './base'

module Sorting
  class QuickSortHoare < Base
    protected

    def sort(left = 0, right = arr.length - 1)
      return if left >= right

      p = partition(left, right)

      sort(left, p)
      sort(p + 1, right)
    end

    def partition(left, right)
      lpos, rpos, pivot = left - 1, right + 1, arr[left]

      loop do
        loop do
          lpos += 1
          break if arr[lpos] >= pivot
        end

        loop do
          rpos -= 1
          break if arr[rpos] <= pivot
        end

        return rpos if lpos >= rpos

        arr[lpos], arr[rpos] = arr[rpos], arr[lpos]
      end
    end
  end
end
