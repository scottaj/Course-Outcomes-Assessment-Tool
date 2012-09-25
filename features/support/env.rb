PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")

require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'prickle/capybara'
require 'database_cleaner'
require 'database_cleaner/cucumber'

DatabaseCleaner.strategy = :truncation

class CourseOutcomesWorld
  include Capybara::DSL
  include Prickle::Capybara
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  CourseOutcomesWorld.new
end

##
# You can handle all padrino applications using instead:
#   Padrino.application
Capybara.app = CourseOutcomes


Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
