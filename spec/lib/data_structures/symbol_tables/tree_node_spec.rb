require 'spec_helper'

RSpec.describe DataStructures::SymbolTables::TreeNode do
  subject(:root) { described_class.new(:key, :value) }

  describe '#initialize' do
    its(:key) { is_expected.to eq(:key) }
    its(:value) { is_expected.to eq(:value) }
  end
end

