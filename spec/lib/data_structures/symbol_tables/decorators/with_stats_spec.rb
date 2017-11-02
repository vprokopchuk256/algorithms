require 'spec_helper'

RSpec.describe DataStructures::SymbolTables::Decorators::WithStats do
  let(:root) { TreeNode.new(:key, :value) }

  subject(:tree) { described_class.new(root) }

  describe '#initialize' do
    its(:key) { is_expected.to eq(:key) }
    its(:value) { is_expected.to eq(:value) }
  end

  describe '#height' do
    subject { tree.height }

    it { is_expected.to eq(0) }

    context 'when there is one left node' do
      before { root.left = TreeNode.new(:left_key, :left_value) }

      it { is_expected.to eq(1) }

      context 'and there is also right node' do
        before { root.right = TreeNode.new(:right_key, :right_value) }

        it { is_expected.to eq(1) }
      end
    end
  end
end
