# Définition de la classe Game
class Game
  # On garde une référence au joueur humain et aux ennemis
  attr_accessor :human_player, :enemies_in_sight, :players_left
  # => Permet de lire/écrire ces trois attributs depuis l’extérieur de la classe.

  # Initialisation du jeu
  def initialize(name)
    @human_player = HumanPlayer.new(name)  # Crée le joueur humain avec 100 PV et une arme niveau 1
    @players_left = 10                     # Nombre total d’ennemis à affronter dans la partie
    @enemies_in_sight = []                 # Liste des ennemis visibles au départ (vide)
  end

  # Supprime un joueur mort de la liste des ennemis visibles
  def kill_player(player)
    @enemies_in_sight.delete(player)       # Retire l’ennemi du tableau
    puts "Le joueur #{player.name} est éliminé !"  # Message indiquant l’élimination
  end

  # Vérifie si le jeu continue
  def is_still_ongoing?
    @human_player.life_points > 0 && (@players_left > 0 || !@enemies_in_sight.empty?)
    # => Le jeu continue tant que le joueur humain est vivant ET qu’il reste des ennemis à combattre.
  end

  # Affiche l’état du joueur humain et le nombre d’ennemis restants
  def show_players
    @human_player.show_state               # Affiche PV et arme du joueur humain
    puts "Il reste #{@players_left} ennemis à combattre."  # Indique combien d’ennemis restent à apparaître
  end

  # Affiche le menu des actions possibles
  def menu
    puts "\nQuelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "attaquer un joueur en vue :"
    @enemies_in_sight.each_with_index do |enemy, index|
      # Parcourt les ennemis visibles avec leur index
      puts "#{index} - #{enemy.name} a #{enemy.life_points} points de vie" if enemy.life_points > 0
      # Affiche uniquement les ennemis encore vivants
    end
  end

  # Exécute l’action choisie par l’utilisateur
  def menu_choice(choice)
    if choice == "a"
      @human_player.search_weapon          # Cherche une nouvelle arme
    elsif choice == "s"
      @human_player.search_health_pack     # Cherche un pack de soin
    else
      index = choice.to_i                  # Convertit le choix en nombre pour attaquer un ennemi
      if enemy = @enemies_in_sight[index]  # Vérifie si un ennemi correspond à cet index
        @human_player.attacks(enemy)       # Le joueur humain attaque cet ennemi
        kill_player(enemy) if enemy.life_points <= 0  # Si l’ennemi meurt, on le retire de la liste
      else
        puts "Choix invalide."             # Message si l’index ne correspond à aucun ennemi
      end
    end
  end

  # Les ennemis attaquent le joueur humain
  def enemies_attack
    @enemies_in_sight.each do |enemy|
      enemy.attacks(@human_player) if enemy.life_points > 0
      # Chaque ennemi vivant attaque le joueur humain
    end
  end

  # Ajoute de nouveaux ennemis en vue
  def new_players_in_sight
    if @players_left <= @enemies_in_sight.size
      puts "Tous les joueurs sont déjà en vue."
      # Si tous les ennemis restants sont déjà visibles, aucun nouveau n’arrive
    else
      dice = rand(1..6)                    # Lance un dé à 6 faces
      if dice == 1
        puts "Aucun nouvel adversaire n’arrive."
      elsif dice >= 2 && dice <= 4
        new_enemy = Player.new("joueur_#{rand(1000..9999)}")
        @enemies_in_sight << new_enemy     # Ajoute un nouvel ennemi
        @players_left -= 1                 # Diminue le compteur d’ennemis restants
        puts "Un nouvel adversaire arrive : #{new_enemy.name} !"
      else
        2.times do
          new_enemy = Player.new("joueur_#{rand(1000..9999)}")
          @enemies_in_sight << new_enemy   # Ajoute deux nouveaux ennemis
          @players_left -= 1
          puts "Deux nouveaux adversaires arrivent : #{new_enemy.name} !"
        end
      end
    end
  end

  # Affiche le message de fin de partie
  def end
    puts "\nLa partie est finie."
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNÉ !"         # Victoire si le joueur humain est vivant
    else
      puts "Loser ! Tu as perdu !"         # Défaite sinon
    end
  end
end
