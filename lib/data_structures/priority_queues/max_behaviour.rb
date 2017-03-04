module Algorithms
  module DataStructures
    module PriorityQueues
      module MaxBehaviour
        def initialize(attribute = :itself)
          super(:<, attribute)
        end

        def self.included(base)
          base.send(:alias_method, :del_max, :del)
        end
      end
    end
  end
end
