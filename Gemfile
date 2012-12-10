source :rubygems

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'slim'
gem 'activerecord', :require => "active_record"
gem 'mysql'
gem 'pg'
gem 'bcrypt-ruby'

group :development do
  gem "ruby_parser"
  gem 'pry'
end

group :nowin do # Any gems that don't work on windows.

end

# Test requirements
group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'cucumber'
  gem 'rack-test'
  gem "database_cleaner"
  gem "prickle"
end

# Padrino Stable Gem
gem 'padrino', '0.10.7'

# Or Padrino Edge
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.7'
# end
