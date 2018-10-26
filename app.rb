require 'sinatra'
require 'json'
require_relative 'game'

set :game, Game.new
set :show_exceptions, false

get '/' do
  settings.game.print_board
end

get '/reset' do
  settings.game = Game.new
  redirect '/'
end

post '/' do
  params = JSON.parse(request.body.read)
  settings.game.make_move(row: params['row'], column: params['column'], value: params['value'])
end


error Board::NotEmptyCoordinateError do
  "Coordinate is not empty, please try a different one"
end

error Game::NotYourTurnError do
  "Sorry, not your turn now.."
end

error Game::BoardFullError do
  "Sorry, no empty places on the board.. please reset the game"
end

error Game::Winner do
  "Sorry, the game already has a winner: #{settings.game.winner}.. please reset the game"
end
