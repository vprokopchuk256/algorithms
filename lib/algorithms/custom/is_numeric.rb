module Algorithms
  module Custom
    class IsNumeric < Struct.new(:num)
      class Symbol
        def initialize(exp = nil)
          @exp = exp
        end

        def add_next(*ns)
          ns.each { |n| nexts << n }
          self
        end

        def evaluate(chr)
          @exp.call(chr)
        end

        def get_next(chr)
          nexts.find{ |n| n.evaluate(chr) }
        end

        def final?
          nexts.empty?
        end

        private

        def nexts
          @nexts ||= []
        end
      end

      class Final < Symbol
        def initialize
          super(-> (chr) { chr.nil? })
        end
      end

      class Char < Symbol
        def initialize(*chr)
          super(-> (c) { chr.include?(c) })
        end
      end

      class Digit < Char
        def initialize
          super(*('0'..'9').to_a)
        end
      end


      class Blank < Char
        def initialize
          super(' ')
        end
      end

      class NFA
        TransitionNotAvailable = Class.new(StandardError)

        def initialize
          @root = Symbol.new

          num1, num2, num3 = Digit.new, Digit.new, Digit.new
          final = Final.new
          dot1 = Char.new('.')
          dot2 = Char.new('.')
          blank1 = Blank.new
          blank2 = Blank.new
          exp = Char.new('e')
          exp_sign = Char.new('-', '+')
          leading_sign = Char.new('-', '+')

          @root.add_next(num1, dot1, blank1, leading_sign)

          num1.add_next(num1, dot2, exp, final, blank2)
          blank1.add_next(num1, dot1, blank1, leading_sign)
          dot1.add_next(num2)
          dot2.add_next(num2, blank2, final, exp)
          num2.add_next(num2, blank2, exp, final)
          exp.add_next(num3, exp_sign)
          exp_sign.add_next(num3)
          num3.add_next(num3, blank2, final)
          blank2.add_next(blank2, final)
          leading_sign.add_next(num1, dot1)
        end

        def evaluate(chr)
          @root = @root.get_next(chr) or raise TransitionNotAvailable
        end

        def final?
          @root.final?
        end
      end

      def execute
        return false if num.nil?

        (0..num.length).each_with_object(NFA.new){ |i, n| n.evaluate(num[i]) }.final?
      rescue NFA::TransitionNotAvailable
        false
      end
    end
  end
end
