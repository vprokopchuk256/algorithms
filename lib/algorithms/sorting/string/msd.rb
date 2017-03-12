module Algorithms
  module Sorting
    class MSD
      R = 256 #ASCII

      class StringArray < SimpleDelegator
        def char_at(i, d)
          at(i)[d]&.ord || -1
        end
      end
      private_constant :StringArray

      class Count < Struct.new(:arr, :lo, :hi, :d)
        def initialize(arr, lo, hi, d)
          super

          calculate_occurences
          aggregate_occurences
        end

        def [](idx)
          count[idx]
        end

        def inc(idx)
          count[idx] += 1
        end

        private

        def calculate_occurences
          lo.upto(hi).each{ |i| inc(arr.char_at(i, d) + 2) }
        end

        def aggregate_occurences
          1.upto(R + 1).each{ |i| count[i] += count[i - 1] }
        end

        def count
          @count ||= Array.new(R + 2, 0)
        end
      end
      private_constant :Count

      class Sorter < Struct.new(:arr, :aux, :lo, :hi, :d)
        def execute
          Count.new(arr, lo, hi, d).tap do |count|
            fill_aux(count)
            fill_arr
          end
        end

        private

        def fill_aux(count)
          lo.upto(hi).each do |i|
            aux[count[arr.char_at(i, d) + 1]] = arr[i]
            count.inc(arr.char_at(i, d) + 1)
          end
        end

        def fill_arr
          lo.upto(hi).each { |i| arr[i] = aux[i - lo] }
        end
      end

      attr_reader :arr

      def initialize(arr)
        @arr = StringArray.new(arr)
      end

      def execute
        sort(Array.new(arr.length), 0, arr.length - 1, 0)
      end

      private

      def sort(aux, lo, hi, d)
        return unless lo < hi

        count = Sorter.new(arr, aux, lo, hi, d).execute

        0.upto(R - 1).each do |r|
          sort(aux, lo + count[r], lo + count[r + 1] - 1, d + 1)
        end
      end
    end
  end
end
