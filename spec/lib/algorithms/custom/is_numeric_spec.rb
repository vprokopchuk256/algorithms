require 'spec_helper'

RSpec.describe Algorithms::Custom::IsNumeric do
  def self.is_numeric(*nums)
    nums.each do |num|
      it "detects #{num} as numeric" do
        expect(described_class.new(num).execute).to eq(true)
      end
    end
  end

  def self.non_numeric(*nums)
    nums.each do |num|
      it "detects #{num} as numeric" do
        expect(described_class.new(num).execute).to eq(false)
      end
    end
  end

  is_numeric(
    '1',
    '1 ',
    '123',
    '12345',
    '.123',
    '23.45',
    '0',
    ' 0.1 ',
    '12e10',
    ' 12e10 ',
    '12e-10',
    ' 12e-10 ',
    ' 1.2e-10 ',
    ' 1.2e10 ',
    ' .2e-10 ',
    ' .2e+10 ',
    '3.',
    '3. ',
    '-1',
    '-0.1',
    '-.1',
    '+1',
    '+0.1',
    '+.1',
    '46.e3',
    ' -54.53061'
  )
  non_numeric(
    nil,
    '',
    'aaa',
    '123,5',
    ' ',
    '1 a',
    '12e--010',
    '.'
  )
end
