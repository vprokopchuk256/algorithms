require_relative 'base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class Min < Base
        def initialize(attribute = :itself)
          super(:>, attribute)
        end

        alias_method :del_min, :del

        def insert(key)
          super(key, key)
        end
      end
    end
  end
end
