require 'spec_helper'

describe RuboCop::Select::File do
  it 'returns no intersection' do
    expect(described_class.intersect(['foo'], 'bar', ['baz'], 'goo')).to eq([])
  end
end
