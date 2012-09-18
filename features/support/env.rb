PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")

require 'capybara/cucumber'
require 'rspec/expectations'
require 'prickle/capybara'

World do
  include Capybara::DSL
  include Prickle::Capybara
end

##
# You can handle all padrino applications using instead:
#   Padrino.application
Capybara.app = CourseOutcomes.tap { |app|  }
