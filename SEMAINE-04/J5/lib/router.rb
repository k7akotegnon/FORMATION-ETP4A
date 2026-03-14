require_relative 'controller'  # On charge le controller

class Router
  def initialize
    @controller = Controller.new  # On crée une instance du controller
  end

  def perform
    puts "BIENVENUE DANS THE GOSSIP PROJECT"

    while true  # Boucle infinie tant que l’utilisateur ne quitte pas
      puts "Tu veux faire quoi jeune mouss' ?"
      puts "1. Créer un gossip"
      puts "2. Afficher tous les gossips"
      puts "3. Supprimer un gossip"
      puts "4. Quitter l'app"

      params = gets.chomp.to_i  # On récupère le choix utilisateur

      case params
      when 1
        @controller.create_gossip
      when 2
        @controller.index_gossips
      when 3
        @controller.destroy_gossip
      when 4
        puts "À bientôt !"
        break  # On sort de la boucle
      else
        puts "❌ Choix invalide, réessaie."
      end
    end
  end
end
