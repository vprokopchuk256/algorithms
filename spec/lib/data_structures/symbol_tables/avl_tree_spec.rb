require 'spec_helper'

RSpec.describe DataStructures::SymbolTables::AvlTree do
  subject(:tree) { described_class.new }

  context 'example' do
    before do
      StackProf.run(mode: :cpu, out: '/tmp/prof.dump') do
        arr.each do |v|
          tree.put(v)
        end
      end
    end

    # context 'ex1' do
    #   let(:arr) { [43, 18] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '  43  ',
    #       '18    '
    #     ].join('\n'))
    #   end
    # end

    # context 'ex2' do
    #   let(:arr) { [43, 18, 22] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '  22  ',
    #       '18  43'
    #     ].join('\n'))
    #   end
    # end

    # context 'ex3' do
    #   let(:arr) { [43, 18, 22, 9] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '      22      ',
    #       '  18      43  ',
    #       '9             '
    #     ].join('\n'))
    #   end
    # end

    # context 'ex4' do
    #   let(:arr) { [43, 18, 22, 9, 21] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '      22      ',
    #       '  18      43  ',
    #       '9   21        '
    #     ].join('\n'))
    #   end
    # end

    # context 'ex5' do
    #   let(:arr) { [43, 18, 22, 9, 21, 6] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '      18      ',
    #       '  9       22  ',
    #       '6       21  43'
    #     ].join('\n'))
    #   end
    # end

    # context 'ex6' do
    #   let(:arr) { [43, 18, 22, 9, 21, 6, 8] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '      18      ',
    #       '  8       22  ',
    #       '6   9   21  43'
    #     ].join('\n'))
    #   end
    # end

    # context 'ex7' do
    #   let(:arr) { [43, 18, 22, 9, 21, 6, 8, 20] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '              18              ',
    #       '      8               22      ',
    #       '  6       9       21      43  ',
    #       '                20            ',
    #     ].join('\n'))
    #   end
    # end

    # context 'ex8' do
    #   let(:arr) { [43, 18, 22, 9, 21, 6, 8, 20, 63] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '              18              ',
    #       '      8               22      ',
    #       '  6       9       21      43  ',
    #       '                20          63',
    #     ].join('\n'))
    #   end
    # end

    # context 'ex9' do
    #   let(:arr) { [43, 18, 22, 9, 21, 6, 8, 20, 63, 50] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '              18              ',
    #       '      8               22      ',
    #       '  6       9       21      50  ',
    #       '                20      43  63',
    #     ].join('\n'))
    #   end
    # end

    # context 'ex9' do
    #   let(:arr) { [43, 18, 22, 9, 21, 6, 8, 20, 63, 50, 62] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '              22              ',
    #       '      18              50      ',
    #       '  8       21      43      63  ',
    #       '6   9   20              62    ',
    #     ].join('\n'))
    #   end
    # end

    # context 'ex10' do
    #   let(:arr) { [43, 18, 22, 9, 21, 6, 8, 20, 63, 50, 62, 51] }

    #   its(:size) { is_expected.to eq(arr.size) }
    #   its(:to_s) do
    #     is_expected.to eq([
    #       '              22              ',
    #       '      18              50      ',
    #       '  8       21      43      62  ',
    #       '6   9   20              51  63',
    #     ].join('\n'))
    #   end
    # end

    context 'ex11' do
      let(:arr) { 50000.downto(1).to_a }

      it { is_expected.not_to be_nil }
      # its(:size) { is_expected.to eq(arr.size) }
    end
  end
end
