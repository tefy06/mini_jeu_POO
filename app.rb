require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'




player1 = Player.new("Alphonse")
player2 = Player.new("fred")

while player1.life_points > 0 && player2.life_points > 0
puts "\nVoici l'état de chaque joueur :"
player1.show_state
player2.show_state

puts "\nPassons à la phase d'attaque :"

player1.attacks(player2)
if player2.life_points > 0
  player2.attacks(player1)
else
  break
end

end







binding.pry
