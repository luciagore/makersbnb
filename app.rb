require 'sinatra/base'
require 'sinatra/flash'
require 'json'
require_relative 'lib/spaces'
# controller class
class BNBmanager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/getusers' do
    @spaces = Spaces.all

    content_type :json
    @spaces.map{ |space| space.to_hash }.to_json
  end

  get '/new' do
    erb :newspace
  end

  post '/new' do
    space = Spaces.create(
      name_of_space: params[:name_of_space],
      email: params[:email],
      description: params[:description]
      )
    content_type :json
    space.to_hash.to_json
  end

  get '/test_ajax' do
    erb :test_ajax
  end

  run if app_file == $0
end
