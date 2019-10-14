

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
