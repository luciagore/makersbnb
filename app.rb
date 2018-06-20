
require 'sinatra/base'
require 'sinatra/flash'
require 'json'
require_relative 'lib/spaces'
require_relative 'lib/requests'
require_relative 'lib/users'
require_relative 'lib/mailer'
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

  get '/newrequest' do
    @space_id = params[:space_id]
    erb :newrequests
  end

  post '/newrequest'do
    request = Requests.create(
      space_id: params[:space_id],
      body: params[:body],
      email: params[:email]
      )

    content_type :json
    request.to_hash.to_json
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = Users.create(
      email: params[:email],
      password: params[:password],
      username: params[:username],
      name: params[:name]
    )

    session[:username] = user.username

    content_type :json
    user.to_hash.to_json
  end

  get('/signin')do
    erb :signin
  end

  post('/signin') do
    user = Users.authenticate(
      email: params[:email],
      password: params[:password]
    )
    session[:username] = user.username

    content_type :json
    user.to_hash.to_json
  end

  get '/test_ajax' do
    erb :test_ajax
  end

  run if app_file == $0
end
