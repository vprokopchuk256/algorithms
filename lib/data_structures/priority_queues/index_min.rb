require_relative 'index_base'
require_relative 'min_behaviour'

module Algorithms
  module DataStructures
    module PriorityQueues
      class IndexMin < IndexBase
        include MinBehaviour

        def decrease_key(index, key)
          keys[index] = key
          swim(qp[index])
        end

        def increase_key(index, key)
          keys[index] = key
          sink(qp[index])
        end
      end
    end
  end
end
