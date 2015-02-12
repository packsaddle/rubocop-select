require 'spec_helper'

describe RuboCop::Select::File do
  let(:target_files) { ['foo'] }
  let(:target_dir) { 'baz' }
  let(:compare_files) { ['baz'] }
  let(:compare_dir) { 'goo' }
  let(:empty_files) { [] }
  it 'returns no intersection' do
    expect(described_class.intersect(
             target_files,
             target_dir,
             compare_files,
             compare_dir
           )).to eq(empty_files)
  end
end
