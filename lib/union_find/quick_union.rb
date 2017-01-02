require_relative 'base'

module UnionFind
  class QuickUnion < Base
    def union(p, q)
      items[root(p)] = root(q)
    end

    def connected?(p, q)
      root(p) == root(q)
    end

    private

    def root(i)
      i = items[i] while items[i] != i
      i
    end
  end
end
