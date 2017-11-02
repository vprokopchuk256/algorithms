class TreeNode
  attr_reader :key
  attr_accessor :value, :left, :right

  def initialize key, value
    @key, @value = key, value
  end
end

