require 'bundler'  
# Charge la bibliothèque Bundler, qui permet de gérer les gems (paquets Ruby).

Bundler.require  
# Active toutes les gems listées dans ton Gemfile, pour qu’elles soient disponibles dans ton projet.

require_relative 'lib/game'  
# Charge le fichier game.rb (même si pour l’instant il n’est pas encore utilisé).

require_relative 'lib/player'  
# Charge le fichier player.rb, qui contient les classes Player et HumanPlayer.

# Message d'accueil
puts "------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
puts "| Le but du jeu est d'être le dernier survivant ! |"
puts "------------------------------------------------"
# Affiche un message de bienvenue stylisé pour introduire le jeu.

# Initialisation du joueur humain
puts "Quel est ton prénom ?"  
# Demande au joueur humain de saisir son prénom.
print "> "  
# Affiche un petit prompt ">" pour rendre la saisie plus claire.
user_name = gets.chomp  
# Récupère la saisie de l’utilisateur et la stocke dans la variable user_name.
user = HumanPlayer.new(user_name)  
# Crée un objet HumanPlayer avec ce prénom, 100 PV et une arme de niveau 1.

# Initialisation des ennemis
player1 = Player.new("Josiane")  
# Crée un joueur "Josiane" avec 10 PV.
player2 = Player.new("José")  
# Crée un joueur "José" avec 10 PV.
enemies = [player1, player2]   # On stocke les ennemis dans un tableau
# Met les deux ennemis dans un tableau pour pouvoir les parcourir facilement.

# Boucle de combat
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)  
# Tant que le joueur humain est vivant ET qu’au moins un des deux ennemis est vivant, la boucle continue.

  # Affiche l'état du joueur humain
  user.show_state  
  # Affiche les PV et le niveau d’arme du joueur humain.

  # Menu des actions
  puts "\nQuelle action veux-tu effectuer ?"  
  # Affiche le menu des choix possibles.
  puts "a - chercher une meilleure arme"  
  # Option pour améliorer son arme.
  puts "s - chercher à se soigner"  
  # Option pour chercher un pack de soin.
  puts "attaquer un joueur en vue :"  
  # Option pour attaquer un ennemi.
  enemies.each_with_index do |enemy, index|  
    # Parcourt le tableau des ennemis avec leur index.
    if enemy.life_points > 0  
      # Vérifie que l’ennemi est encore vivant.
      puts "#{index} - #{enemy.show_state}"  
      # Affiche l’état de l’ennemi (nom et PV).
    end
  end

  # Saisie de l'utilisateur
  print "> "  
  # Affiche un prompt pour la saisie.
  choice = gets.chomp  
  # Récupère le choix de l’utilisateur.

  # Actions en fonction du choix
  if choice == "a"  
    user.search_weapon  
    # Si l’utilisateur tape "a", il cherche une nouvelle arme.
  elsif choice == "s"  
    user.search_health_pack  
    # Si l’utilisateur tape "s", il cherche un pack de soin.
  elsif choice == "0"  
    user.attacks(player1) if player1.life_points > 0  
    # Si l’utilisateur tape "0", il attaque Josiane (si elle est encore vivante).
  elsif choice == "1"  
    user.attacks(player2) if player2.life_points > 0  
    # Si l’utilisateur tape "1", il attaque José (si il est encore vivant).
  else  
    puts "Choix invalide, essaie encore."  
    # Si l’utilisateur tape autre chose, on affiche un message d’erreur.
  end

  # Riposte des ennemis
  puts "\nLes autres joueurs t'attaquent !"  
  # Indique que c’est au tour des ennemis.
  enemies.each do |enemy|  
    # Parcourt le tableau des ennemis.
    if enemy.life_points > 0  
      # Vérifie que l’ennemi est vivant.
      enemy.attacks(user)  
      # L’ennemi attaque le joueur humain.
    end
  end
end

# Fin du jeu
puts "\nLa partie est finie"  
# Affiche un message de fin de partie.
if user.life_points > 0  
  puts "BRAVO ! TU AS GAGNÉ !"  
  # Si le joueur humain est encore vivant, il a gagné.
else  
  puts "Loser ! Tu as perdu !"  
  # Sinon, il a perdu.
end
