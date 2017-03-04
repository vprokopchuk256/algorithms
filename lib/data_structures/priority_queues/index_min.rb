require_relative 'base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class IndexMin < Base
        def initialize(attribute = :itself)
          super(:>, attribute)
        end

        alias_method :del_min, :del
      end
    end
  end
end
