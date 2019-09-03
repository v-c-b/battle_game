require 'sinatra'
require 'shotgun'
require 'sinatra/base'


set    :session_secret, "here be dragons"

class Battle_app < Sinatra::Base

  get '/' do
    'Hello Battle!'
  end

  run! if app_file == $0


end
