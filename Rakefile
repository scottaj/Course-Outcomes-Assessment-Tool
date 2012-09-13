require File.expand_path('../config/boot.rb', __FILE__)
require 'padrino-core/cli/rake'
PadrinoTasks.init

begin
  desc "Run continuous integration tests"
  task :ci => [:spec, :features]
rescue LoadError
  puts "CI task not working, are you in production?"
end
