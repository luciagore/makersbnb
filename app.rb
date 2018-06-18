require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/spaces'
# controller class
class BNBmanager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @spaces = Spaces.all
    erb :index
  end

  get '/spaces/new' do
    erb :newspace
  end

  post '/spaces/new' do
    p params['email']
    Spaces.create(
      name_of_space: params['name_of_space'],
      email: params['email'],
      description: params['description']
    )
    redirect '/'
  end

  run if app_file == $0
end
