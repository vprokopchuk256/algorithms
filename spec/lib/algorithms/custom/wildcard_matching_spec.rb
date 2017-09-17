require 'spec_helper'

RSpec.describe Algorithms::Custom::WildcardMatching do
  let(:s) { 'a' }
  let(:p) { 'a' }

  subject(:algorithm) { described_class.new(s, p) }

  describe '#initialize' do
    its(:s) { is_expected.to eq(s) }
    its(:p) { is_expected.to eq(p) }
  end

  describe '#execute' do
    subject { algorithm.execute }

    it { is_expected.to eq(true) }

    context 'ex1' do
      let(:s) { 'aa' }
      let(:p) { 'a' }

      it { is_expected.to eq(false) }
    end

    context 'ex2' do
      let(:s) { 'aa' }
      let(:p) { 'aa' }

      it { is_expected.to eq(true) }
    end

    context 'ex3' do
      let(:s) { 'aaa' }
      let(:p) { 'aa' }

      it { is_expected.to eq(false) }
    end

    context 'ex4' do
      let(:s) { 'aa' }
      let(:p) { '*' }

      it { is_expected.to eq(true) }
    end

    context 'ex5' do
      let(:s) { 'aa' }
      let(:p) { 'a*' }

      it { is_expected.to eq(true) }
    end

    context 'ex5.1' do
      let(:s) { 'a' }
      let(:p) { 'a*' }

      it { is_expected.to eq(true) }
    end

    context 'ex5' do
      let(:s) { 'aa' }
      let(:p) { '?*' }

      it { is_expected.to eq(true) }
    end

    context 'ex6' do
      let(:s) { 'aab' }
      let(:p) { 'c*a*b*' }

      it { is_expected.to eq(false) }
    end

    context 'ex7' do
      let(:s) { '' }
      let(:p) { '*' }

      it { is_expected.to eq(true) }
    end

    context 'ex8' do
      let(:s) { nil }
      let(:p) { '*' }

      it { is_expected.to eq(true) }
    end

    context 'ex9' do
      let(:s) { '' }
      let(:p) { '' }

      it { is_expected.to eq(true) }
    end

    context 'ex10' do
      let(:s) { ' ' }
      let(:p) { '' }

      it { is_expected.to eq(false) }
    end

    context 'ex11' do
      let(:s) { 'aa' }
      let(:p) { '***a****' }

      it { is_expected.to eq(true) }
    end

    context 'ex12' do
      let(:s) { 'aa' }
      let(:p) { 'a****a' }

      it { is_expected.to eq(true) }
    end

    context 'ex13' do
      let(:s) { 'abefcdgiescdfimde' }
      let(:p) { 'ab*cd?i*de' }

      it { is_expected.to eq(true) }
    end

    context 'ex14' do
      let(:s) { 'leetcode' }
      let(:p) { '*e*t?d*' }

      it { is_expected.to eq(false) }
    end

    context 'ex15' do
      let(:s) { 'aaabababaaabaababbbaaaabbbbbbabbbbabbbabbaabbababab' }
      let(:p) { '*ab***ba**b*b*aaab*b' }

      it { is_expected.to eq(true) }
    end

    context 'ex16' do
      let(:s) { 'c' }
      let(:p) { '*?*' }

      it { is_expected.to eq(true) }
    end

    context 'ex17' do
      let(:s) do
        'aaaabaaaabbbbaabbbaabbaababbabbaaaababaaabbbbbbaabbbabababbaaabaabaaaaaabbaabbbbaababbababaabbbaababbbba'
      end
      let(:p) do
        '*****b*aba***babaa*bbaba***a*aaba*b*aa**a*b**ba***a*a*'
      end

      it { is_expected.to eq(true) }
    end

    context 'ex18' do
      let(:s) do
        'babbbbaabababaabbababaababaabbaabababbaaababbababaaaaaabbabaaaabababbabbababbbaaaababbbabbbbbbbbbbaabbb'
      end
      let(:p) do
        'b*bb*a**bba*b**a*bbb**aba***babbb*aa****aabb*bbb***a'
      end

      it { is_expected.to eq(false) }
    end
  end
end
