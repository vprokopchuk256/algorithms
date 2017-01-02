module UnionFind
  class QuickUnion
    def initialize(number_of_items)
      @items = Array.new(number_of_items, &:itself)
    end

    def union(p, q)
      @items[root(p)] = root(q)
    end

    def connected?(p, q)
      root(p) == root(q)
    end

    private

    def root(i)
      i = @items[i] while @items[i] != i
      i
    end
  end
end
