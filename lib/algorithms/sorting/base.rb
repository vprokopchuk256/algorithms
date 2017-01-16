require_relative '../utils/swap'

module Algorithms
  module Sorting
    class Base < Struct.new(:arr)
      include Utils::Swap

      def execute
        sort
        arr
      end
    end
  end
end
