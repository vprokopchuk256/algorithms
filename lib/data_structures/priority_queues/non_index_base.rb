require_relative 'base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class NonIndexBase < Base
        def insert(key)
          super(key, key)
        end
      end
    end
  end
end
