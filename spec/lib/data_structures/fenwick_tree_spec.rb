require 'spec_helper'

RSpec.describe Algorithms::DataStructures::FenwickTree do
  let(:length) { 0 }

  subject(:tree) { described_class.new(length) }

  describe '#initialize' do
    its(:length) { is_expected.to eq(length) }
  end

  its(:to_a) { is_expected.to eq([0]) }
  its(:sum) { is_expected.to be_zero }

  context 'length == 1' do
    let(:length) { 1 }

    its(:to_a) { is_expected.to eq([0, 0]) }
    its(:sum) { is_expected.to be_zero }

    context 'when increased' do
      before { tree.inc(1, 10) }

      its(:to_a) { is_expected.to eq([0, 10]) }
      its(:sum) { is_expected.to eq(10) }
    end
  end

  context 'length == 2' do
    let(:length) { 2 }

    its(:to_a) { is_expected.to eq([0, 0, 0]) }
    its(:sum) { is_expected.to be_zero }

    context 'when increased first item' do
      before { tree.inc(1, 10) }

      its(:to_a) { is_expected.to eq([0, 10, 10]) }
      its(:sum) { is_expected.to eq(10) }

      context 'and increased secons item' do
        before { tree.inc(2, 10) }

        its(:to_a) { is_expected.to eq([0, 10, 20]) }
        its(:sum) { is_expected.to eq(20) }
      end
    end
  end

  context 'length == 3' do
    let(:length) { 3 }

    its(:to_a) { is_expected.to eq([0, 0, 0, 0]) }
    its(:sum) { is_expected.to be_zero }

    context 'when increased first item' do
      before { tree.inc(1, 10) }

      its(:to_a) { is_expected.to eq([0, 10, 10, 0]) }
      its(:sum) { is_expected.to eq(10) }

      context 'and increased second item' do
        before { tree.inc(2, 10) }

        its(:to_a) { is_expected.to eq([0, 10, 20, 0]) }
        its(:sum) { is_expected.to eq(20) }#

        context 'and increased third item' do
          before { tree.inc(3, 10) }

          its(:to_a) { is_expected.to eq([0, 10, 20, 10]) }
          its(:sum) { is_expected.to eq(30) }
        end
      end
    end
  end

  context 'length == 8' do
    let(:length) { 8 }

    its(:to_a) { is_expected.to eq([0, 0, 0, 0, 0, 0, 0, 0, 0]) }
    its(:sum) { is_expected.to be_zero }

    context 'when increased first item' do
      before { tree.inc(1, 10) }

      its(:to_a) { is_expected.to eq([0, 10, 10, 0, 10, 0, 0, 0, 10]) }
      its(:sum) { is_expected.to eq(10) }

      context 'and increased second item' do
        before { tree.inc(2, 10) }

        its(:to_a) { is_expected.to eq([0, 10, 20, 0, 20, 0, 0, 0, 20]) }
        its(:sum) { is_expected.to eq(20) }

        context 'and increased third item' do
          before { tree.inc(3, 10) }

          its(:to_a) { is_expected.to eq([0, 10, 20, 10, 30, 0, 0, 0, 30]) }
          its(:sum) { is_expected.to eq(30) }

          context 'and increased 4th item' do
            before { tree.inc(4, 10) }

            its(:to_a) { is_expected.to eq([0, 10, 20, 10, 40, 0, 0, 0, 40]) }
            its(:sum) { is_expected.to eq(40) }

            context 'and increased 5th item' do
              before { tree.inc(5, 10) }

              its(:to_a) { is_expected.to eq([0, 10, 20, 10, 40, 10, 10, 0, 50]) }
              its(:sum) { is_expected.to eq(50) }

              context 'and increased 6th item' do
                before { tree.inc(6, 10) }

                its(:to_a) { is_expected.to eq([0, 10, 20, 10, 40, 10, 20, 0, 60]) }
                its(:sum) { is_expected.to eq(60) }

                context 'and increased 7th item' do
                  before { tree.inc(7, 10) }

                  its(:to_a) { is_expected.to eq([0, 10, 20, 10, 40, 10, 20, 10, 70]) }
                  its(:sum) { is_expected.to eq(70) }

                  context 'and increased 7th item' do
                    before { tree.inc(8, 10) }
                    its(:sum) { is_expected.to eq(80) }

                    its(:to_a) { is_expected.to eq([0, 10, 20, 10, 40, 10, 20, 10, 80]) }
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
