module Algorithms
  module Custom
class ReversePairsFenwickTree < Struct.new(:arr)
  class FenwickTree < Struct.new(:length)
    def inc(pos)
      while pos > 0 do
        values[pos] += 1
        pos -= nxt(pos)
      end
    end

    def sum(pos)
      res = 0

      i = pos

      while i <= length
        res += values[i]
        i += nxt(i)
      end

      return res
    end

    def to_a
      values
    end

    private

    def values
      @values ||= Array.new(length + 1, 0)
    end

    def nxt(i)
      i & -i
    end
  end

  def execute
    return 0 unless arr && arr.length > 1

    res = 0

    arr.each do |value|
      if sorted_arr.last > value * 2 && pos = sorted_arr.bsearch_index{ |x| x >= value * 2 + 1 }
        res += fenwick_tree.sum(pos + 1)
      end
      fenwick_tree.inc(sorted_arr.bsearch_index{ |x| x >= value } + 1)
    end

    res
  end

  private

  def sorted_arr
    @sorted_arr ||= arr.sort
  end

  def fenwick_tree
    @fenwick_tree ||= FenwickTree.new(arr.length)
  end
end
  end
end
