module Algorithms
  module Sorting
    class KeyIndexedCounting
      class Sorter
        def initialize(arr, &block)
          @arr = arr
          @block = block
        end

        def execute
          count_occurences
          aggregate_occurences
          compose_result
        end

        private

        def count
          @count ||= [0].tap do |c|
            def c.[](index)
              self.at(index) || 0
            end
          end
        end

        def count_occurences
          @arr.each { |v| count[to_i(v) + 1] += 1 }
        end

        def aggregate_occurences
          (1...count.size).each{ |i| count[i] += count[i -1] }
        end

        def compose_result
          @arr.each_with_object([]) do |v, res|
            res[count[to_i(v)]] = v
            count[to_i(v)] += 1
          end
        end

        def to_i(v)
          @block ? @block.call(v) : v
        end
      end

      private_constant :Sorter

      def initialize(arr, &block)
        @arr = arr
        @block = block
      end

      def execute
        Sorter.new(@arr, &@block).execute
      end
    end
  end
end
