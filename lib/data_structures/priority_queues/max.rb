require_relative 'base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class Max < Base
        def initialize(property = :itself)
          super(:<, property)
        end

        alias_method :del_max, :del
      end
    end
  end
end
