module Algorithms
  module Search
    module Substring
      class KMP < Struct.new(:pattern)
        R = 256

        class DFA
          def initialize(pattern)
            @length = pattern.length
            @table = build_table(pattern)
          end

          def check(char)
            (@pos = @table[char][@pos.to_i]) == @length
          end

          private

          def build_table(pattern)
            Array.new(R) { Array.new(pattern.length, 0) }.tap do |res|
              res[pattern[0].ord][0] = 1

              pattern.each_byte.lazy.each_with_index.drop(1).inject(0) do |x, (b, j)|
                0.upto(R - 1) { |c| res[c][j] = res[c][x] }
                res[b][j] = j + 1
                res[b][x]
              end
            end
          end
        end
        private_constant :DFA

        def execute(text)
          text.to_s.each_byte.lazy.collect(&dfa.method(:check)).any?
        end

        private

        def dfa
          @dfa ||= DFA.new(pattern)
        end
      end
    end
  end
end
