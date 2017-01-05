require_relative 'base'

module Algorithms
  module UnionFind
    class QuickFind < Base
      def union(p, q)
        if (pid = items[p]) != (qid = items[q])
          items.each_with_index do |id, index|
            items[index] = qid if items[index] == pid
          end
        end
      end

      def connected?(p, q)
        items[p] == items[q]
      end
    end
  end
end
