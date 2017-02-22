require_relative '../../../data_structures/priority_queues/min'

module Algorithms
  module Graph
    module MST
      class Base
        include Enumerable

        attr_reader :graph

        def initialize(graph)
          @graph = graph
        end
      end
    end
  end
end
