require_relative 'directed_edge'

module Algorithms
  module DataStructures
    module Graphs
      class SP
        Error = Class.new(StandardError)

        attr_reader :s

        def initialize(s)
          @s = s

          @distance_to = []
          @distance_to[s] = 0

          @edge_to = []
        end

        def distance_to(v)
          raise Error unless @distance_to[v]

          return @distance_to[v]
        end

        def path_to(v)
          return [s] if v == s
          raise Error unless edge = edge_to(v)

          res = [v]

          while edge
            res.unshift(edge.from)
            edge = edge_to(edge.from)
          end

          res
        end

        def relax(edge)
          @edge_to[edge.to] = edge
          @distance_to[edge.to] = edge.weight + (distance_to(edge.from) || 0)
        end

        private

        def edge_to(v)
          @edge_to[v]
        end
      end
    end
  end
end
