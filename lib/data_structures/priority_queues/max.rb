require_relative 'base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class Max < Base
        def initialize
          super(:<)
        end

        alias_method :del_max, :del
      end
    end
  end
end
