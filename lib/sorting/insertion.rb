module Sorting
  class Insertion < Struct.new(:arr)
    def execute
      until (1...arr.length).select(&method(:swap)).empty? do; end
      arr
    end

    private

    def swap(i)
      (arr[i], arr[i - 1] = arr[i - 1], arr[i]) if arr[i] < arr[i - 1]
    end
  end
end
