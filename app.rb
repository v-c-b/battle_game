require 'sinatra'
require 'shotgun'
require 'sinatra/base'


set    :session_secret, "here be dragons"

$STARTHP = 100

class Battle_app < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:Player1_Name] = params[:Player1_Name]
    session[:Player2_Name]= params[:Player2_Name]
    redirect '/play'
  end

  get '/play' do
    @Player1_Name = session[:Player1_Name]
    @Player2_Name = session[:Player2_Name]
    @Player1_HP = $STARTHP
    @Player2_HP = $STARTHP
    erb :play
  end

  get '/attackp2' do
    @Player1_Name = session[:Player1_Name]
    @Player2_Name = session[:Player2_Name]
    erb :attackp2
  end


  run! if app_file == $0

end
