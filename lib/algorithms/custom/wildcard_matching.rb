module Algorithms
  module Custom
    class WildcardMatching < Struct.new(:s, :p)
      class ReverseStringSplitter
        include Enumerable

        SEPARATORS = ['*', '?']

        attr_reader :s

        def initialize(s)
          @s = s
        end

        def each
          return enum_for(:each) unless block_given?

          pos = s.length - 1

          (s.length - 1).downto(0) do |idx|
            if separator?(chr = s[idx])
              yield s[idx + 1, pos - idx] if pos > idx
              yield chr
              pos = idx - 1
            elsif idx == 0 && pos >= 0
              yield s[idx, pos + 1]
            end
          end
        end

        private

        def separator?(chr)
          SEPARATORS.include?(chr)
        end
      end

      class State < Struct.new(:next_state, :value)
        def count
          @counter = (@counter || 1) + 1

          puts ["#{self.class.name.split('::').last}(#{value})", @counter].join(' - ')
        end
      end

      class SState < State
        def match(str, pos)
          throw :not_found if pos + value.length > str.length

          return false unless str[pos, value.length] == value

          return true if pos + value.length == str.length && next_state.nil?

          !!next_state&.match(str, pos + value.length)
        end
      end

      class QState < State
        def match(str, pos)
          throw :not_found if pos == str.length

          return true if pos == str.length - 1 && next_state.nil?

          !!next_state&.match(str, pos + 1)
        end
      end

      class AState < State
        def match(str, pos)
          return next_state.nil? if pos == str.length

          next_state&.match(str, pos) ||
          next_state&.match(str, pos + 1) ||
          match(str, pos + 1)
        end
      end

      class Matcher < Struct.new(:initial_state)
        def match(str)
          catch :not_found do
            return initial_state&.match(str, 0)
          end

          false
        end

        def self.compile(s)
          new(ReverseStringSplitter.new(s).inject(nil, &method(:create_state)))
        end

        private

        def self.create_state(next_state, value)
          klass = case value
            when '?' then QState
            when '*' then AState
            else SState
          end

          klass.new(next_state, value)
        end
      end

      def execute
        cp = p.gsub(/\*+/, '*')

        s == cp || cp == '*' || !!Matcher.compile(cp).match(s)
      end
    end
  end
end
