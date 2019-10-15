require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'


puts "Je sortais de chez la féli quand un homme encapuchonné me dit d'une voix a peine audible:'escusez moi de vous deranger,\nFabio ya deux types qui veulent vous parler'"
puts "betement je réponds je m'apelle pas fabio, je m'apelle ... \n<ton nom> "

  name = gets.chomp
  ennemies = []
  puts "\nici commence ma descente aux enfers\n"

  player1 = Player.new("Jean-eudes")
  player2 = Player.new("Jocelin")
  human = HumanPlayer.new(name)

  while player1.life_points >0 || player2.life_points >0

    puts "\nconsience :Quelle action veut tu effectuer ? \na - chercher une meilleure arme \ns - chercher à se soigner \n"
    puts "\nattaquer un joueur en vue :\n0 - #{player1.name} a #{player1.life_points} points de vie\n1 - #{player2.name} a #{player2.life_points}\n"
    puts "\n #{human.show_state}"

    keyboard = gets.chomp
    if keyboard == "a"
      human.search_weapon
    elsif keyboard =="s"
      human.search_health_pack
      human.life_points
    elsif keyboard == "0"
      player1.life_points
      human.attacks(player1)
    elsif keyboard == "1"
      player2.life_points
      human.attacks(player2)
    end

    puts "\n"
     player1.attacks(human)
     player2.attacks(human)
     human.show_state
  end

  if human.life_points > 0
  puts "consience : Bravo tu as tué des personnes vraiment violentes, par contre tu va en prison là .."
  else
  puts "la mort :tu tes fait tuer pour rien RIP'"
  end
binding.pry
