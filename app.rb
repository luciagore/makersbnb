require 'sinatra/base'

class BNBmanager < Sinatra::Base

  get '/' do
    'hullo world'
  end
  
  run if app_file == $0
end
