require 'bundler'  
# Charge la bibliothèque Bundler, qui permet de gérer les gems (paquets Ruby).

Bundler.require  
# Active toutes les gems listées dans ton Gemfile, pour qu’elles soient disponibles dans ton projet.

require_relative 'lib/game'  
# Charge le fichier game.rb situé dans le dossier lib (même si pour l’instant il n’est pas utilisé).

require_relative 'lib/player'  
# Charge le fichier player.rb situé dans le dossier lib, qui contient la définition de la classe Player.

# Création des deux joueurs
player1 = Player.new("Josiane")  
# Instancie un objet Player avec le nom "Josiane" et 10 points de vie par défaut.

player2 = Player.new("José")  
# Instancie un autre objet Player avec le nom "José" et 10 points de vie par défaut.

# Boucle de combat : continue tant que les deux joueurs sont vivants
while player1.life_points > 0 && player2.life_points > 0  
# Tant que Josiane ET José ont plus de 0 points de vie, la boucle continue.

  puts "\nVoici l'état de nos joueurs :"  
  # Affiche un message indiquant qu’on va montrer l’état des joueurs.
  
  player1.show_state  
  # Appelle la méthode show_state sur player1 → affiche ses points de vie.

  player2.show_state  
  # Appelle la méthode show_state sur player2 → affiche ses points de vie.

  puts "\nPassons à la phase d'attaque :"  
  # Indique que la phase d’attaque commence.

  # Josiane attaque José
  player1.attacks(player2)  
  # Appelle la méthode attacks sur player1, en ciblant player2.
  # Cela affiche un message, calcule des dégâts aléatoires, et les soustrait aux points de vie de José.

  # Vérifie si José est mort → on arrête le combat
  break if player2.life_points <= 0  
  # Si José n’a plus de points de vie, on sort immédiatement de la boucle (combat terminé).

  # José riposte
  player2.attacks(player1)  
  # Si José est encore vivant, il attaque Josiane à son tour.
end

puts "\nCombat terminé !"  
# Une fois la boucle terminée (qu’un joueur est mort), on affiche que le combat est fini.
