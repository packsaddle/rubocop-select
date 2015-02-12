# RuboCop::Select

Select file path only executeable by RuboCop.

## Usage

Pipe between `git diff` and `rubocop`.

```sh
$ git diff -z --name-only origin/master..HEAD | xargs -0 bundle exec rubocop-select | xargs rubocop
```

## What is this?

I changed files.

```sh
$ git diff --name-only origin/master..HEAD
.rubocop.yml
README.md
Rakefile
lib/rubocop/select/file.rb
```

I want to run rubocop on changed files.

```sh
$ git diff --name-only origin/master..HEAD | xargs rubocop
Inspecting 4 files
EF.C

Offenses:

.rubocop.yml:10:9: E: unexpected token tLABEL
Metrics/LineLength:
        ^^^^^^^^^^^
.rubocop.yml:14:7: E: unexpected token tLABEL
Style/Documentation:
      ^^^^^^^^^^^^^^
.rubocop.yml:19:7: E: unexpected token tLABEL
Style/RegexpLiteral:
      ^^^^^^^^^^^^^^
(snip)
```

I don't want to run rubocop with `.rubocop.yml`, `README.md`.
This is why `rubocop-select` comes.

```sh
$ git diff -z --name-only origin/master..HEAD | xargs -0 bundle exec rubocop-select
/Users/sane/work/ruby-study/rubocop-select/Rakefile
/Users/sane/work/ruby-study/rubocop-select/lib/rubocop/select/file.rb
```

Great!

```sh
$ git diff -z --name-only origin/master..HEAD | xargs -0 bundle exec rubocop-select| xargs rubocop
Inspecting 2 files
.C

Offenses:

lib/rubocop/select/file.rb:21:1: C: Trailing whitespace detected.

2 files inspected, 1 offense detected
```

:) :) :)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-select'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubocop-select

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/packsaddle/rubocop-select/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
