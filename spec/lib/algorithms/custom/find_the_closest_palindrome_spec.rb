require 'spec_helper'

RSpec.describe Algorithms::Custom::FindTheClosestPalindrome do
  let(:num) { '1' }

  subject(:algorithm) { described_class.new(num) }

  describe '#initialize' do
    its(:num) { is_expected.to eq(num) }
  end

  def self.chk(num, palindrome)
    describe "for num == #{num}" do
      let(:num) { num }

      it "equals #{palindrome}" do
        expect(algorithm.execute).to eq(palindrome)
      end
    end
  end

  chk('1', '0')
  chk('2', '1')
  chk('10', '9')
  chk('11', '9')
  chk('12', '11')
  chk('123', '121')
  chk('12345', '12321')
  chk('10987', '11011')
  chk('109987', '110011')
  chk('1000', '999')
  chk('1001', '999')
  chk('1805170081', '1805115081')
end
