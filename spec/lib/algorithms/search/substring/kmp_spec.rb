require 'spec_helper'

RSpec.describe Algorithms::Search::Substring::KMP do
  let(:pattern) { 'a' }
  let(:algorithm) { described_class.new(pattern) }

  describe '#execute' do
    subject { algorithm.execute(text) }

    context 'UC1' do
      let(:text) { '' }

      it { is_expected.to eq(false) }
    end

    context 'UC2' do
      let(:text) { nil }

      it { is_expected.to eq(false) }
    end

    context 'UC3' do
      let(:text) { 'a' }

      it { is_expected.to eq(true) }
    end

    context 'UC4' do
      let(:text) { 'b' }

      it { is_expected.to eq(false) }
    end

    context 'UC5' do
      let(:text) { 'aaa' }

      it { is_expected.to eq(true) }
    end

    context 'UC6' do
      let(:pattern) { 'aaa' }
      let(:text) { 'a' }

      it { is_expected.to eq(false) }
    end

    context 'UC7' do
      let(:pattern) { 'aa' }
      let(:text) { 'aa' }

      it { is_expected.to eq(true) }
    end

    context 'UC8' do
      let(:pattern) { 'aa' }
      let(:text) { 'baab' }

      it { is_expected.to eq(true) }
    end

    context 'UC9' do
      let(:pattern) { 'aab' }
      let(:text) { 'baa' }

      it { is_expected.to eq(false) }
    end
  end
end
