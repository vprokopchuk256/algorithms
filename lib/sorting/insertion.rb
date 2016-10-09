require_relative './base'

module Sorting
  class Insertion < Base
    protected

    def sort
      until (1...arr.length).select(&method(:swap)).empty? do; end
    end

    def swap(i)
      (arr[i], arr[i - 1] = arr[i - 1], arr[i]) if arr[i] < arr[i - 1]
    end
  end
end
