module Algorithms
  module Search
    module Substring
      class BM < Struct.new(:pattern)
        R = 256

        def execute(text)
          return false if text.to_s.empty?

          n = text.length
          m = pattern.length

          i = 0

          while i <= n - m do
            skip = 0

            (m - 1).downto(0) do |j|
              if (pattern.getbyte(j) != text.getbyte(i + j))
                skip = [1, j - right[text.getbyte(i + j)]].max
                break
              end
            end

            return true if skip == 0

            i += skip
          end

          false
        end

        private

        def right
          @right ||= Array.new(R, -1).tap do |r|
            pattern.each_byte.each_with_index { |b, i| r[b] = i }
          end
        end
      end
    end
  end
end
