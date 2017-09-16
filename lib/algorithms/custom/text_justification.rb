module Algorithms
  module Custom
    class TextJustification < Struct.new(:words, :max_width)
      class WordBatches
        include Enumerable

        attr_reader :words, :max_width

        def initialize(words, max_width)
          @words = words
          @max_width = max_width
        end

        def each
          return enum_for(:each) unless block_given?

          length = 0
          batch = []

          words.each do |word|
            if length + word.length > max_width - batch.length
              yield [batch, length, false]
              batch = [word]
              length = word.length
            else
              batch << word
              length += word.length
            end
          end

          yield [batch, length, true]
        end
      end
      private_constant :WordBatches

      def execute
        WordBatches.new(words, max_width).collect do |batch, length, final|
          final ? justify_last_line(batch, length) : justify_line(batch, length)
        end
      end

      private

      def justify_line(batch, length)
        return batch.first.ljust(max_width) if batch.length == 1

        div, mod = (max_width - length).divmod(batch.length - 1)

        [
          batch.first(mod + 1).join(' ' * (div + 1)),
          batch.last(batch.length - mod - 1).join(' ' * div)
        ].join(' ' * div)
      end

      def justify_last_line(batch, length)
        batch.join(' ').ljust(max_width)
      end
    end
  end
end
