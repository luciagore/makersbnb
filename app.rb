require 'sinatra/base'

# controller class
class BNBmanager < Sinatra::Base
  get '/' do
    'hullo world'
  end

  get '/spaces/new' do
    erb :newspace
  end

  run if app_file == $0
end
