module Algorithms
  module DataStructures
    module PriorityQueues
      module MinBehaviour
        def initialize(attribute = :itself)
          super(:>, attribute)
        end

        def self.included(base)
          base.send(:alias_method, :del_min, :del)
        end
      end
    end
  end
end
