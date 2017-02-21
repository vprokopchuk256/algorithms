require_relative 'base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class Min < Base
        def initialize(property = :itself)
          super(:>, property)
        end

        alias_method :del_min, :del
      end
    end
  end
end
