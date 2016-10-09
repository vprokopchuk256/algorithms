module Sorting
  class Base < Struct.new(:arr)
    def execute
      sort
      arr
    end
  end
end
