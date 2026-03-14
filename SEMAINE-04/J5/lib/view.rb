# lib/view.rb
class View
  # Demande à l’utilisateur de créer un gossip
  def create_gossip
    puts "Auteur du gossip :"
    author = gets.chomp
    puts "Contenu du gossip :"
    content = gets.chomp
    return { author: author, content: content }  # Retourne un hash
  end

  # Affiche tous les gossips
  def index_gossips(gossips)
    puts "📜 Liste des gossips :"
    gossips.each_with_index do |gossip, index|
      puts "#{index + 1}. #{gossip.author} : #{gossip.content}"
    end
  end

  # Demande quel gossip supprimer
  def ask_id_to_delete
    puts "Quel gossip veux-tu supprimer ? (numéro)"
    gets.chomp.to_i
  end
end
