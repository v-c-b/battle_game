require 'sinatra'
require 'shotgun'
require 'sinatra/base'


set    :session_secret, "here be dragons"

class Battle_app < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $GAME = Game.new((params[:Player1_Name]), (params[:Player2_Name]))
    redirect '/play'
  end

  get '/play' do
    @Player1_Name = $GAME.p1.name
    @Player2_Name = $GAME.p2.name
    @Player1_HP = $GAME.p1.hit_points
    @Player2_HP = $GAME.p2.hit_points
    erb :play
  end

  get '/attackp2' do
    @Player1_Name = $GAME.p1.name
    @Player2_Name = $GAME.p2.name
    $GAME.attack($GAME.p2)
    erb :attackp2
  end


  run! if app_file == $0

end
