require_relative '../../../data_structures/graphs/sp'
require_relative '../../../data_structures/priority_queues/index_min'

module Algorithms
  module Graph
    module SP
      class Dijkstra < Struct.new(:s, :graph)
        Error = Class.new(StandardError)

        class ExecuteContext < Struct.new(:s, :graph)

          def execute
            while !pq.empty?
              v = pq.del_min

              graph.adj(v).each(&method(:relax))
            end

            sp
          end

          private

          def relax(edge)
            enqueue(edge.to) if sp.relax(edge)
          end

          def pq
            @pq ||= DataStructures::PriorityQueues::IndexMin.new.tap{ |p| enqueue(s, p) }
          end

          def sp
            @sp ||= DataStructures::Graphs::SP.new(s)
          end

          def enqueue(w, q = pq)
            q.contains?(w) ? q.decrease_key(w, sp.distance_to(w)) : q.insert(w, sp.distance_to(w))
          end
        end

        def execute
          raise Error if graph.empty?

          ExecuteContext.new(s, graph).execute
        end
      end
    end
  end
end
