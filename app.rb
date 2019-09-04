require 'sinatra'
require 'shotgun'
require 'sinatra/base'
require './lib/game.rb'
require './lib/player.rb'

set :session_secret, 'here be dragons'

# Defines the routes for Sinatra
class BattleApp < Sinatra::Base
  before do
    @game = Game.the_game
  end

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    @game = Game.create(params[:Player1_Name], params[:Player2_Name])
    redirect '/play'
  end

  get '/play' do
    @game = Game.the_game
    @player1_name = @game.p1.name
    @player2_name = @game.p2.name
    @player1_hp = @game.p1.hit_points
    @player2_hp = @game.p2.hit_points
    erb :play
  end

  get '/attack' do
    @game = Game.the_game
    @attacker = @game.current_turn.name
    @receiver = @game.receiver.name
    @game.attack(@game.receiver)
    @game.switch_turn
    if @game.game_over?
      redirect('/end')
    else
      erb :attack
    end
  end

  get '/end' do
    @game = Game.the_game
    @loser = @game.loser.name
    erb :end
  end

  run! if app_file == $PROGRAM_NAME
end
