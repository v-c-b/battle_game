require 'sinatra'
require 'shotgun'
require 'sinatra/base'


set    :session_secret, "here be dragons"

class Battle_app < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/names' do
    @player_1_name = params[:Player1_Name]
    @player_2_name = params[:Player2_Name]
    erb :play  end

  run! if app_file == $0


end
