require 'spec_helper'

RSpec.describe DataStructures::SymbolTables::Decorators::Printable do
  let(:root) { TreeNode.new(:key, 10) }

  subject(:tree) { described_class.new(root) }

  describe '#initialize' do
    its(:key) { is_expected.to eq(:key) }
    its(:value) { is_expected.to eq(10) }
  end

  describe '#print' do
    subject { tree.to_s }

    it { is_expected.to eq('10') }

    context 'when there are children nodes' do
      let(:left) { TreeNode.new(:left_key, 11) }
      let(:right) { TreeNode.new(:right_key, 12) }

      before do
        root.left = left
        root.right = right
      end

      it do
        is_expected.to eq([
          '  10  ',
          '11  12'
        ].join('\n'))
      end

      context 'and there is grand childrens' do
        let(:left_right) { TreeNode.new(:left_right_key, 13) }
        let(:right_left) { TreeNode.new(:right_left_key, 14) }

        before do
          left.right = left_right
          right.left = right_left
        end

        it do
          is_expected.to eq([
            '      10      ',
            '  11      12  ',
            '    13  14    '
          ].join('\n'))
        end
      end
    end
  end
end
