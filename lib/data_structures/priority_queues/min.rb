require_relative 'non_index_base'
require_relative 'min_behaviour'

module Algorithms
  module DataStructures
    module PriorityQueues
      class Min < NonIndexBase
        include MinBehaviour
      end
    end
  end
end
