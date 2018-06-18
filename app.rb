require 'sinatra/base'
require 'sinatra/flash'

# controller class
class BNBmanager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  get '/' do
    'hullo world'
  end

  get '/spaces/new' do
    erb :newspace
  end

  post '/spaces/new' do
    flash[:invalid_notice] = "Lucy's house Home for rent! test@example.com"
    redirect '/spaces/new'
  end

  run if app_file == $0
end
