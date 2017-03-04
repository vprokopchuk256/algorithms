require_relative 'max_behaviour'
require_relative 'non_index_base'


module Algorithms
  module DataStructures
    module PriorityQueues
      class Max < NonIndexBase
        include MaxBehaviour
      end
    end
  end
end
