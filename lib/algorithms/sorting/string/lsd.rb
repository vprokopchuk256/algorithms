module Algorithms
  module Sorting
    class LSD < Struct.new(:length, :arr)
      class Sorter < Struct.new(:arr, :pos, :aux, :count)
        def execute
          count_occurences
          aggregate_occurences
          compose_aux
          copy_aux
        end

        private

        def count_occurences
          arr.each { |v| count[to_i(v) + 1] += 1 }
        end

        def aggregate_occurences
          (1...count.size).each{ |i| count[i] += count[i -1] }
        end

        def compose_aux
          arr.each do |v|
            aux[count[to_i(v)]] = v
            count[to_i(v)] += 1
          end
        end

        def copy_aux
          aux.each_index { |i| arr[i] = aux[i] }
        end

        def to_i(v)
          v[pos].ord
        end
      end

      def execute
        aux = Array.new(arr.length)
        count = Array.new(256, 0)

        (length - 1).downto(0).each do |i|
          Sorter.new(arr, i, aux, count).execute
          count.each_index{ |i| count[i] = 0 }
        end
      end
    end
  end
end
