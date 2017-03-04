require_relative 'base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class Max < Base
        def initialize(attribute = :itself)
          super(:<, attribute)
        end

        alias_method :del_max, :del

        def insert(key)
          super(key, key)
        end
      end
    end
  end
end
