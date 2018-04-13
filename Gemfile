# It is meant to be installed on top of ChefDK which provides the majority
# of the necessary gems for testing this cookbook
#
# Run 'chef exec bundle install' to install these dependencies

source 'https://rubygems.org'

gem 'dnsmadeeasy', '~> 0.3.2'
gem 'sym', '~> 2'

group :development, :test do
  gem 'stove'
  gem 'community_cookbook_releaser'
  gem 'rspec', '~> 3.7'
  gem 'rspec-its'
end

