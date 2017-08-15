source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'activeresource', '~> 5.0'
gem 'dotenv', '~> 2.2', '>= 2.2.1'
gem 'coffee-rails', '~> 4.2'
gem 'haml-rails', '~> 1.0'
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.3'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'better_errors', '~> 2.3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_girl_rails', '~> 4.8'
  gem 'pry-rails', '~> 0.3.6'
  gem 'rspec-rails', '~> 3.6', '>= 3.6.1'
  gem 'reek', '~> 4.7', '>= 4.7.2'
  gem 'rubocop', '~> 0.49.1'
  gem 'simplecov', '~> 0.15.0'
end

group :development do
# gem 'capistrano-rails'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
