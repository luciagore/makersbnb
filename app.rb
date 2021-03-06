
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
    @user = Users.find(session[:id]) if session[:id]
    erb :index
  end

  post '/getusers' do
    @spaces = Spaces.all

    content_type :json
    @spaces.map{ |space| space.to_hash }.to_json
  end

  get '/new' do
    @user_id = Users.find(session[:id]).id
    erb :newspace
  end

  post '/new' do
    @filename = params[:file][:filename]
    file = params[:file][:tempfile]
    @savefilename = "#{params[:user_id]+@filename}"
    File.open("./public/userimages/#{@savefilename}", 'wb') do |f|
      f.write(file.read)
    end
    space = Spaces.create(
      name_of_space: params[:name_of_space],
      email: params[:email],
      description: params[:description],
      price_per_night: params[:price_per_night].to_f,
      image_name: @savefilename,
      user_id: params[:user_id].to_i
      )

    content_type :json
    space.to_hash.to_json
    redirect '/'
  end

  get '/newrequest' do
    @space_id = params[:space_id].to_i
    p @space_id
    @user_id = Users.find(session[:id]).id
    erb :newrequests
  end

  post '/newrequest'do
    request = Requests.create(
      space_id: params[:space_id],
      body: params[:body],
      email: params[:email],
      user_id: params[:user_id]
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

    session[:id] = user.id

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
    if user
      session[:id] = user.id
      content_type :json
      user.to_hash.to_json
    else
      "error"
    end

  end


  post('/signout') do
    session[:id] = nil
  end

  get '/test_ajax' do
    erb :test_ajax
  end

  run if app_file == $0
end
