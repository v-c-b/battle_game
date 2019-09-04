require 'sinatra'
require 'shotgun'
require 'sinatra/base'
require './lib/game.rb'
require './lib/player.rb'

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
    @game = $GAME
    @Player1_Name = @game.p1.name
    @Player2_Name = @game.p2.name
    @Player1_HP = @game.p1.hit_points
    @Player2_HP = @game.p2.hit_points
    erb :play
  end

  get '/attack' do
    @game = $GAME
    @Attacker = @game.current_turn.name
    @Receiver = @game.receiver.name
    @game.attack(@game.receiver)
    @game.switch_turn
    if @game.game_over?
      redirect('/end')
    else
      erb :attack
    end
  end

  get '/end' do
    @game = $GAME
    @loser = @game.loser.name
    erb :end
  end


  run! if app_file == $0

end
