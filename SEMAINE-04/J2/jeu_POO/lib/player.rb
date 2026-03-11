# ------------------------------------------------
# CLASSE PLAYER
# ------------------------------------------------

# Définition de la classe Player
class Player
  # On crée des accesseurs pour pouvoir lire/écrire le nom et les points de vie
  attr_accessor :name, :life_points

  # Méthode d'initialisation : chaque joueur a un nom et 10 points de vie au départ
  def initialize(name)
    @name = name          # Stocke le nom du joueur
    @life_points = 10     # Initialise les points de vie à 10
  end

  # Affiche l'état actuel du joueur
  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  # Méthode pour subir des dégâts
  def gets_damage(damage)
    @life_points -= damage   # Soustrait les dégâts aux points de vie
    if @life_points <= 0     # Vérifie si le joueur est mort
      @life_points = 0       # Empêche d’avoir des points de vie négatifs
      puts "Le joueur #{@name} a été tué !" 
    end
  end

  # Méthode pour attaquer un autre joueur
  def attacks(other_player)
    puts "Le joueur #{@name} attaque le joueur #{other_player.name}"
    damage = compute_damage   # Calcule les dégâts infligés (aléatoires)
    other_player.gets_damage(damage) # Applique les dégâts à l’adversaire
    puts "Il lui inflige #{damage} points de dommages"
  end

  # Méthode pour calculer les dégâts (entre 1 et 6 aléatoirement)
  def compute_damage
    return rand(1..6)
  end
end

# ------------------------------------------------
# CLASSE HUMANPLAYER
# ------------------------------------------------
# Classe HumanPlayer qui hérite de Player
class HumanPlayer < Player
  # Ajout d'un nouvel attribut : weapon_level
  attr_accessor :weapon_level

  # Initialisation spécifique pour HumanPlayer
  def initialize(name)
    @name = name            # Nom du joueur humain
    @life_points = 100      # Les humains commencent avec 100 points de vie
    @weapon_level = 1       # Niveau d'arme initial fixé à 1
  end

  # Affiche l'état du joueur humain avec ses points de vie et son arme
  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  # Calcule les dégâts infligés en tenant compte du niveau d'arme
  def compute_damage
    return rand(1..6) * @weapon_level
  end

  # Méthode pour chercher une nouvelle arme
  def search_weapon
    new_weapon = rand(1..6)   # Lance un dé pour déterminer le niveau de la nouvelle arme
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... Elle n'est pas mieux que ton arme actuelle..."
    end
  end

  # Méthode pour chercher un pack de points de vie
  def search_health_pack
    dice = rand(1..6)   # Lance un dé pour déterminer le résultat
    if dice == 1
      puts "Tu n'as rien trouvé..."
    elsif dice >= 2 && dice <= 5
      @life_points += 50
      @life_points = 100 if @life_points > 100   # La vie ne peut pas dépasser 100
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      @life_points += 80
      @life_points = 100 if @life_points > 100
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end
