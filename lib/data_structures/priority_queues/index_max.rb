require_relative 'max_behaviour'
require_relative 'index_base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class IndexMax < IndexBase
        include MaxBehaviour

        def decrease_key(index, key)
          keys[index] = key
          sink(qp[index])
        end

        def increase_key(index, key)
          keys[index] = key
          swim(qp[index])
        end
      end
    end
  end
end
