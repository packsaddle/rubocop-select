require 'spec_helper'

describe RuboCop::Select::File do
  context 'random files' do
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
  context 'hit one file' do
    let(:target_files) { ['foo', 'bar'] }
    let(:target_dir) { '/woo' }
    let(:compare_files) { ['bar', 'baz'] }
    let(:compare_dir) { '/woo' }
    let(:hit_one_file) { [(Pathname.new '/woo/bar')] }
    it 'returns one intersection' do
      expect(described_class.intersect(
               target_files,
               target_dir,
               compare_files,
               compare_dir
             )).to eq(hit_one_file)
    end
  end
end
