require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'

puts "police, carte d'identitée svp"
puts"<decline ton identité>"
get_name = gets.chomp

my_game = Game.new(get_name)

while my_game.is_still_ongoing
  my_game.show_players()
  my_game.menu()
  my_game.menu_choice()
  if my_game.is_still_ongoing
    my_game.ennemies_attacks()
  end
end

my_game.end
