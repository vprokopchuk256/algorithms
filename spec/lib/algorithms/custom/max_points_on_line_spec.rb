require 'spec_helper'

RSpec.describe Algorithms::Custom::MaxPointsOnLine do
  Point = Struct.new(:x, :y)

  let(:points) { [] }

  subject(:algorithm) do
    described_class.new(points.collect{ |p| Point.new(*p) }).execute
  end

  it { is_expected.to eq(0) }

  context 'ex1' do
    let(:points) { [[0, 0], [1, 1]] }

    it { is_expected.to eq(2) }
  end

  context 'ex2' do
    let(:points) { [[0, 0], [1, 1], [2, 2]] }

    it { is_expected.to eq(3) }
  end

  context 'ex3' do
    let(:points) { [[0, 0], [1, 2], [2, 2]] }

    it { is_expected.to eq(2) }
  end

  context 'ex3' do
    let(:points) { [[0, 0], [1, 1], [2, 2], [1, 0], [2, 1], [3, 2], [4, 3]] }

    it { is_expected.to eq(4) }
  end

  context 'ex4' do
    let(:points) { [ [84,250], [0,0], [1,0], [0,-70], [0,-70], [1,-1], [21,10], [42,90], [-42,-230] ] }

    it { is_expected.to eq(6) }
  end

  context 'ex5' do
    let(:points) { [[0, 0], [1, 1], [0, 0]] }

    it { is_expected.to eq(3) }
  end

  context 'ex6' do
    let(:points) { [[0, 0], [1, 1], [0, 0], [2, 2], [2, 2]] }

    it { is_expected.to eq(5) }
  end
end
