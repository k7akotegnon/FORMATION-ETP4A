require 'bundler'  
# Charge Bundler, qui gère les gems (paquets Ruby).

Bundler.require  
# Active toutes les gems listées dans ton Gemfile.

require_relative 'lib/game'  
# Charge le fichier game.rb, qui contient la classe Game.

require_relative 'lib/player'  
# Charge le fichier player.rb, qui contient les classes Player et HumanPlayer.

# Message de bienvenue
puts "------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "------------------------------------------------"
# Affiche un message d’accueil stylisé pour introduire le jeu.

# Initialisation du joueur humain
puts "Quel est ton prénom ?"  
# Demande à l’utilisateur de saisir son prénom.
print "> "  
# Affiche un petit prompt ">" pour rendre la saisie plus claire.
user_name = gets.chomp  
# Récupère la saisie de l’utilisateur et la stocke dans la variable user_name.
my_game = Game.new(user_name)  
# Crée un objet Game avec ce prénom.  
# Cet objet contient le joueur humain et initialise les ennemis.

# Boucle principale du jeu
while my_game.is_still_ongoing?  
# Tant que le jeu n’est pas terminé (le joueur humain est vivant et il reste des ennemis), la boucle continue.

  my_game.new_players_in_sight   
  # Ajoute éventuellement de nouveaux ennemis visibles en fonction d’un tirage aléatoire.

  my_game.show_players           
  # Affiche l’état du joueur humain (PV, arme) et le nombre d’ennemis restants.

  my_game.menu                   
  # Affiche le menu des actions possibles (chercher arme, soin, attaquer un ennemi).

  print "> "  
  # Affiche un prompt pour la saisie.
  choice = gets.chomp  
  # Récupère le choix de l’utilisateur.
  my_game.menu_choice(choice)    
  # Exécute l’action choisie (arme, soin ou attaque d’un ennemi).

  puts "\nLes ennemis ripostent !"  
  # Indique que c’est au tour des ennemis.
  my_game.enemies_attack         
  # Tous les ennemis visibles et vivants attaquent le joueur humain.
end

# Fin du jeu
my_game.end  
# Affiche le message de fin de partie : victoire si le joueur humain est vivant, défaite sinon.
