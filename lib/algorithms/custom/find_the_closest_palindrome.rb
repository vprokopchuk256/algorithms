module Algorithms
  module Custom
class FindTheClosestPalindrome < Struct.new(:num)
  def execute
    return (num.to_i - 1).to_s if num.length == 1

    num_i = num.to_i

    rev_s = revs(num)
    rev_i = rev_s.to_i

    dec_i = deci(num_i, num.length)
    rev_dec_s = revs(dec_i.to_s)
    rev_dec_i = rev_dec_s.to_i

    inc_i = inci(num_i, num.length)
    rev_inc_s = revs(inc_i.to_s)
    rev_inc_i = rev_inc_s.to_i

    [
      [(num_i - rev_dec_i).abs, rev_dec_i],
      [(num_i - rev_inc_i).abs, rev_inc_i],
      [(rev_i - num_i).abs, rev_i]
    ]
    .reject{ |f, _| f == 0 }
    .min
    .last
    .to_s
  end

  private

  def revs(num_s)
    return num_s if num_s.length == 1

    num_s.clone.tap do |numc|
      numc[numc.length - numc.length / 2, numc.length - 1] = numc[0, numc.length / 2].reverse
    end
  end

  def deci(num_i, length)
    base = 10 ** (length / 2)

    num_i - num_i % base - 1
  end

  def inci(num_i, length)
    base = 10 ** (length / 2)

    num_i + base - num_i % base + 1
  end
end
  end
end
