require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  # Sauvegarde le potin dans le CSV 
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  # Récupère tous les potins sous forme d'array d'objets Gossip 
  # lib/gossip.rb

def self.all
  all_gossips = [] # On initialise un array vide 
  
  # On parcourt chaque ligne du CSV [1]
  CSV.read("./db/gossip.csv").each do |csv_line|
    # On prend l'élément 0 pour l'auteur et l'élément 1 pour le contenu 
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  
  return all_gossips # On retourne l'array d'objets Gossip 
end

  # Trouve un potin spécifique par son ID (index du CSV) 
  def self.find(id)
    all_gossips = self.all
    return all_gossips[id.to_i]
  end
end
