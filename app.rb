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
    $P1 = Player.new(params[:Player1_Name])
    $P2 = Player.new(params[:Player2_Name])
    redirect '/play'
  end

  get '/play' do
    @Player1_Name = $P1.name
    @Player2_Name = $P2.name
    @Player1_HP = $STARTHP
    @Player2_HP = $STARTHP
    erb :play
  end

  get '/attackp2' do
    @Player1_Name = $P1.name
    @Player2_Name = $P2.name
    erb :attackp2
  end


  run! if app_file == $0

end
