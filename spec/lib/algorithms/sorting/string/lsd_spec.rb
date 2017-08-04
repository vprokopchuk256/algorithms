require 'spec_helper'

RSpec.describe Algorithms::Sorting::LSD do
  let(:length) { 3 }
  let(:arr) { %w[dab cab fad bad dad ebb ace add fed bed fee bee] }
  let(:algorithm) { described_class.new(length, arr) }

  describe '#execute' do
    subject { algorithm.execute }

    it 'sorts specified array in place' do
      expect{ subject }.to change{ arr }.to(%w[ace add bad bed bee cab dab dad ebb fad fed fee])
    end
  end
end
