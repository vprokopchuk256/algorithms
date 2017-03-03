require_relative 'index_base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class IndexMin < IndexBase
        def initialize(attribute = :itself)
          super(:>, attribute)
        end

        alias_method :del_min, :del
      end
    end
  end
end
