require_relative 'index_base'

module Algorithms
  module DataStructures
    module PriorityQueues
      class IndexMax < IndexBase
        def initialize(attribute = :itself)
          super(:<, attribute)
        end

        alias_method :del_max, :del
      end
    end
  end
end
