require 'sinatra/base'
require './lib/game'

class Battle < Sinatra::Base

enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    p params
    player1 = Player.new(params[:player1_name])
    player2 = Player.new(params[:player2_name])
    $game = Game.new(player1, player2)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    @game.switch_active_player
    @active_player = @game.active_player
    @inactive_player = @game.inactive_player
    erb(:play)
  end

   get '/attack' do
     @game = $game
     @game.attack(@game.inactive_player)
     erb(:attack)
   end

  run! if app_file == $0

end
