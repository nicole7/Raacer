require_relative 'die'
require_relative 'racer'
require_relative 'reset_screen'

players = ["\u{1F422}", "\u{1F407}", "\u{1F3A9}", "\u{1F40C}"]
die = Die.new
game = Racer.new(players, die)

reset_screen
game.board_visualization
sleep(1)

until game.finished?
  game.advance_player
  game.board_position
  reset_screen
  game.board_visualization
  sleep(0.2)
end

puts "#{game.winner}' wins!"

if game.winner == players[0]
  puts "It does not matter how slowly you go as long as you do not stop"
elsif game.winner == players[1]
  puts "Quick to start and early to finish!"
elsif game.winner == players[2]
  puts "Top hat won? Really??"
else
  puts "Did everyone else take a smoke break?"
end