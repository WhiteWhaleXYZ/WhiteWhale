source 'https://rubygems.org'

# gem 'fontello-rails'
gem "rb-readline"
gem "execjs"
gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"

gem 'rails', '4.2.0'
# gem 'bootstrap-sass',  '3.2.0.0'
gem 'bcrypt', '3.1.7'
# gem 'sqlite3'
# Don't instal pg because its done as a standalone using
#  gem install --user-install pg -- --with-pg-config=/usr/pgsql-9.4/bin/pg_config
gem 'pg'
gem 'faker',  '1.4.2'
# gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

#server
gem 'puma'

#paperclip
gem "paperclip", "~> 4.2"

#acts as taggable
gem 'acts-as-taggable-on', '~> 3.4'

# responders ? 
#gem 'responders', '~> 2.0' 
# paginate
gem 'will_paginate',       '3.0.7'
gem 'bootstrap-will_paginate',    '0.0.10'

#for forking
gem 'amoeba'

#for searching
gem 'sunspot_rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'capistrano', '~> 3.1.0'
  gem 'better_errors'
  gem 'sunspot_solr'
  # Capistrano tasks to manage puma app server
  gem 'capistrano3-puma' , require: false
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rvm', '~> 0.1', require: false

  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring', '~> 1.3.2'
  
end

