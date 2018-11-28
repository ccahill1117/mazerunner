require 'sinatra'
require 'pry'
require 'sinatra/reloader'
require './lib/maze'


get ('/') do

  erb(:initialize)

end

post('/start_game')
  game_difficulty = params['difficulty']
  @@game = Game.new(game_difficulty)
  erb(:game)
end

# get ('/move_to/:id')
#   @@game.current_location =
# end
