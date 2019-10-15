require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'


puts "Je sortais de chez la féli quand un homme encapuchonné me dit d'une voix a peine audible:'escusez moi de vous deranger,\nFabio ya deux types qui veulent vous parler'"
puts "betement je réponds je m'apelle pas fabio, je m'apelle ..."
puts">ton_nom<"

  name = gets.chomp
  ennemies = []
  puts "\nje sens comme une menace, je ne peut plus fuir il est trop tard\n"

  player1 = Player.new("Jean-eudes")
  player2 = Player.new("Jocelin")
  human = HumanPlayer.new(name)

  while (player1.life_points >0 || player2.life_points >0) && human.life_points > 0

    puts "\nQue dois-je faire ? \na - chercher une meilleure arme \ns - chercher à se soigner \n"
    puts "\nattaquer un des gars :"
    if player1.life_points > 0
      puts "0 - #{player1.name} a #{player1.life_points} points de vie"
    end
    if player2.life_points > 0
    puts "1 - #{player2.name} a #{player2.life_points} points de vie\n"
    end
    puts " #{human.show_state}"
    key = 0
    while key == 0 #on fait un genre de while true
    key = 1 #on la met a false apres son demarrage puis on la remet a 0 au debut
    keyboard = gets.chomp
        if keyboard == "a"
          human.search_weapon
        elsif keyboard =="s"
          human.search_health_pack

        elsif keyboard == "0" && player1.life_points > 0

          human.attacks(player1)
        elsif keyboard == "1" && player1.life_points > 0

          human.attacks(player2) #pour checker si le gets.chomp est valide
         else
        puts "il m'est impossible de faire ca"
        key = 0
        end
    end
    puts "\n"
     player1.attacks(human)
     player2.attacks(human)
     human.show_state

  end

  if human.life_points > 0
  puts " Bravo j'ai tué des personnes vraiment violentes, par contre je vais en prison là .."
  else
  puts "la mort :tu tes fait tuer pour rien RIP "
  end
binding.pry
