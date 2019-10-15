class Game
attr_accessor :humanplayer, :ennemies
@@all_games = []

def initialize(name)
@ennemies = []
@humanplayer = HumanPlayer.new(name)
@ennemies.push(Player.new("bertrand"))
@ennemies.push(Player.new("philippe"))
@ennemies.push(Player.new("labrador"))
@ennemies.push(Player.new("jean-eudes"))

@@all_games << self
end

    def kill_player(player)
      @ennemies.delete(player)
    end

    def is_still_ongoing
      if @humanplayer.life_points > 0 && @ennemies.length > 0
        return true
      else
      return false
      end
    end

    def show_players
      puts "\n#{@humanplayer.name} a #{@humanplayer.life_points} points de vie"
      puts "il y a #{@ennemies.length} ennemis"
    end

    def menu
      puts "\n Je suis marron et je ne peut pas fuir je suis encerclé, \nfaire de la thole hors de question \n Quelle action effectuer ? \na - chercher une meilleure arme \ns - chercher à se soigner \n"
      puts "attaquer un flic :"
      i = 0
      while i < @ennemies.length
      puts"#{i} - #{@ennemies[i].name} a #{@ennemies[i].life_points} points de vie"
      i +=1
      end

    end

    def menu_choice
      key = 0

      while key == 0
          key = 1
          keyboard = gets.chomp
        if keyboard == "a"
          @humanplayer.search_weapon
        elsif keyboard =="s"
          puts @humanplayer.search_health_pack
          puts "j'ai desormais #{@humanplayer.life_points} points de vie"
          puts ""
        elsif keyboard == "0" && @ennemies.length >= 1
          @ennemies[0].life_points
          @humanplayer.attacks(@ennemies[0])
            if @ennemies[0].life_points <= 0
              kill_player(@ennemies[0])
            end
        elsif keyboard == "1" && @ennemies.length >= 2
          @ennemies[1].life_points
          @humanplayer.attacks(@ennemies[1])
          if @ennemies[1].life_points <= 0
            kill_player(@ennemies[1])
          end
        elsif keyboard == "2" && @ennemies.length >= 3
          @ennemies[2].life_points
          @humanplayer.attacks(@ennemies[2])
          if @ennemies[2].life_points <= 0
            kill_player(@ennemies[2])
          end
        elsif keyboard == "3" && @ennemies.length >= 4
          @ennemies[3].life_points
          @humanplayer.attacks(@ennemies[3])
          if @ennemies[3].life_points <= 0
            kill_player(@ennemies[3])
          end
        else
          key = 0
          puts"il m'est impossible de faire ca"
        end

    end
  end


    def ennemies_attacks
        @ennemies.each do |en|
        en.attacks(@humanplayer)
        end
    end

    def end
      if @humanplayer.life_points <= 0
        puts "tu est mort, et personne ne pleure pour toi"
      else
        puts "les autres sont morts, tu vas aller en prison"
      end
    end
end
