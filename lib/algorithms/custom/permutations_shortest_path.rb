require 'benchmark'

module Algorithms
  module Custom
class PermutationsShortestPath < Struct.new(:begin_word, :end_word, :word_list)
  class Node
    attr_reader :word, :prev, :length

    def initialize(word, prev = nil)
      @word = word
      @prev = prev
      @length = @prev ? @prev.length + 1 : 1
    end

    def path curr = []
      prev.path(curr) if prev
      curr << word
    end
  end

  def execute
    nodes = []
    visited = {}
    queue = [Node.new(begin_word)]
    min_length = Float::INFINITY

    while (node = queue.shift) && (word = node.word) do
      break if node.length >= min_length

      word_list.each do |w|
        next if visited[w]
        next unless next?(word, w)

        n = Node.new(w, node)

        if w == end_word
          nodes.push(n) and min_length = n.length if n.length <= min_length

          break
        end

        queue.push(n)
      end

      visited[word] = node
    end

    nodes.collect(&:path)
  end

  private

  def next?(word1, word2)
    return false if word1.length != word2.length

    0.upto(word1.length).inject(0) do |cnt, i|
      cnt += 1 if word1[i] != word2[i]

      return false if cnt > 1

      cnt
    end == 1
  end
end
  end
end
