

class Player
  attr_accessor :name, :life_points
  @@all_players = []

  def initialize(name)
    @name = name.to_s
    @life_points = 10
    @@all_players << self
  end

  def show_state

      puts "#{@name} a #{@life_points} points de vie"


  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end

  end

  def attacks(target)
    force = compute_damage
    puts "le joueur #{@name} attaque #{target.name}"
    puts "il lui inflige #{force} points de dommages"

    target.gets_damage(force)
  end

  def compute_damage
   return rand(1..6)
 end

end


class HumanPlayer < Player
  attr_accessor :weapon_level, :life_points, :name
  def initialize(name)
    @life_points = 100
    @weapon_level = 1
    @name = name
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
      rand(1..6) * @weapon_level
  end

  def search_weapon
    @new_weapon = rand(1..6)
    if @new_weapon >= @weapon_level
      @weapon_level = @new_weapon
      puts "Youhou ! elle est meilleure que mon arme actuelle : je la prends\n"
    else
      puts "M@*#$... elle n'est pas mieux que mon arme actuelle..\n"
    end
  end

  def search_health_pack
    rand_health = rand(1..6)
    if rand_health == 1
    return "je n'ai rien trouvé"
  elsif rand_health >= 2 && rand_health <= 5

      @life_points += 50
        if @life_points > 100
          @life_points = 100
        end
        return "j'ai trouve +50 pts de vie"
      else

      @life_points += 80
        if @life_points > 100
          @life_points = 100
        end
        return "Waouh j'ai trouvé un pack de +80 pts de vie"
    end
  end

end
