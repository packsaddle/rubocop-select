require 'spec_helper'

describe 'Rubocop itself method exists' do
  it 'ConfigStore#new' do
    expect { ::RuboCop::ConfigStore.new }.not_to raise_error
  end

  it 'Options#parse' do
    expect { ::RuboCop::Options.new.parse(['some_args']) }.not_to raise_error
  end

  it 'TargetFinder#new' do
    expect { ::RuboCop::TargetFinder.new(::RuboCop::ConfigStore.new) }.not_to raise_error
  end
  it 'TargetFinder#find' do
    target_finder = ::RuboCop::TargetFinder.new(::RuboCop::ConfigStore.new)
    expect { target_finder.find('') }.not_to raise_error
  end
end
