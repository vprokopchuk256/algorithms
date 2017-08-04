require 'spec_helper'

RSpec.describe Algorithms::Sorting::MSD do
  let(:algorithm) { described_class.new(arr) }

  describe '#execute' do
    subject { algorithm.execute }

    context 'uc1' do
      let(:arr) { %w[f e] }

      it { expect{ subject }.to change{ arr }.to(%w[e f]) }
    end

    context 'uc2' do
      let(:arr) { %w[ab aa] }

      it { expect{ subject }.to change{ arr }.to(%w[aa ab]) }
    end

    context 'uc3' do
      let(:arr) { %w[ab a] }

      it { expect{ subject }.to change{ arr }.to(%w[a ab]) }
    end

    context 'uc5' do
      let(:arr) { %w[dab cab fad bad dad ebb ace add fed bed fee bee] }

      it { expect{ subject }.to change{ arr }.to(%w[ace add bad bed bee cab dab dad ebb fad fed fee]) }
    end

    context 'uc6' do
      let(:arr) { %w[dabc dabb daba dab cab fad bad dad ebb ace add fed bed fee bee] }

      it { expect{ subject }.to change{ arr }.to(%w[ace add bad bed bee cab dab daba dabb dabc dad ebb fad fed fee]) }
    end
  end
end
