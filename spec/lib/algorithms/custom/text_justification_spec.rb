require 'spec_helper'

RSpec.describe Algorithms::Custom::TextJustification do
  let(:words) { ['This', 'is', 'an', 'example', 'of', 'text', 'justification.'] }
  let(:max_width) { 16 }

  subject(:algorithm) { described_class.new(words, max_width) }

  describe '#initialize' do
    its(:words) { is_expected.to eq(words) }
    its(:max_width) { is_expected.to eq(max_width) }
  end

  describe '#execute' do
    subject { algorithm.execute }

    it do
      is_expected.to eq(
        [
           'This    is    an',
           'example  of text',
           'justification.  '
        ]
      )
    end

    context 'when length is 1' do
      let(:words) { ['a', 'b', 'c', 'd', 'e'] }
      let(:max_width) { 1 }

      it { is_expected.to eq(words) }
    end

    context 'when only one word is provided' do
      let(:words) { ['justification.'] }

      it { is_expected.to eq(['justification.  ']) }
    end

    context 'if only one word exists in the batch' do
      let(:words) { ['Listen','to','many,','speak','to','a','few.'] }
      let(:max_width) { 6 }

      it { is_expected.to eq(['Listen','to    ','many, ','speak ','to   a','few.  ']) }
    end
  end
end
