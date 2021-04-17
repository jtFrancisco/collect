source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

## Specify your gem's dependencies in collect.gemspec.
gemspec

group :development do
  gem 'pg'
end

group :test do
  gem 'shoulda', '~> 4.0'
end

gem 'dotenv-rails', groups: [:development, :test]
gem 'byebug', group: [:development, :test]
gem 'crack'
gem "responders"
