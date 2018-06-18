ENV['ENVIROMENT'] = 'test'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = BNBmanager
