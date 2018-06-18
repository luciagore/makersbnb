ENV['ENVIROMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'rspec'
require 'rake'
require_relative './support/wait_for_ajax'

Rake.application.load_rakefile

require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = BNBmanager
Capybara.default_driver = :selenium
Capybara.server = :webrick

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end

end
