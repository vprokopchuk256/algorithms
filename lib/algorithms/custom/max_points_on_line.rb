module Algorithms
  module Custom
class MaxPointsOnLine < Struct.new(:points)
  def execute
    return unique.collect(&method(:point_weight)).inject(0, &:+) if unique.count < 3

    unique.permutation(2).inject(0) do |res, (p1, p2)|
      count = 0

      unique.each do |p|
        count += point_weight(p) if (p.x - p1.x)*(p2.y - p1.y) == (p2.x - p1.x)*(p.y - p1.y)
      end

      count > res ? count : res
    end
  end

  private

  def point_weight(p)
    weights[p.x][p.y]
  end

  def weights
    @weights ||= Hash.new do |h1, k1|
      h1[k1] = Hash.new { |h2, k2| h2[k2] = 0 }
    end
  end

  def unique
    @unique ||= points.reject do |p|
      (weights[p.x][p.y] += 1) > 1
    end
  end
end
  end
end
