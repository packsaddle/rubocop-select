# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/select/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-select'
  spec.version       = RuboCop::Select::VERSION
  spec.authors       = ['sanemat']
  spec.email         = ['o.gata.ken@gmail.com']

  spec.summary       = 'Select file path only executable by RuboCop. For Diff RuboCop!'
  spec.description   = 'Pipe between git diff and rubocop.'
  spec.homepage      = 'https://github.com/packsaddle/rubocop-select'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.0'

  spec.files         = `git ls-files -z`
    .split("\x0")
    .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rubocop'
  spec.add_development_dependency 'bundler', '< 2.0', '>= 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2.0'
end
