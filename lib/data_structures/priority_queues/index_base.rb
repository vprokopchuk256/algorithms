require_relative 'base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class IndexBase < Base
        def change_key(index, key)
          keys[index] = key
          swim(qp[index])
          sink(qp[index])
        end
      end
    end
  end
end
