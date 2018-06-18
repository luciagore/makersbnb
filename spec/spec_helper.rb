ENV['ENVIROMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rake'
require_relative './support/wait_for_ajax'

Rake.application.load_rakefile

require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = BNBmanager

RSpec.configure do |config|
  config.before(:suite) do
    Rake::Task['test_database_setup'].execute
  end

end
