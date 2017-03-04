require_relative 'index_base'
require_relative 'min_behaviour'

module Algorithms
  module DataStructures
    module PriorityQueues
      class IndexMin < IndexBase
        include MinBehaviour
      end
    end
  end
end
