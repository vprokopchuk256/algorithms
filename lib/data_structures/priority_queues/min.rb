require_relative 'base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class Min < Base
        def initialize
          super(:>)
        end

        alias_method :del_min, :del
      end
    end
  end
end
