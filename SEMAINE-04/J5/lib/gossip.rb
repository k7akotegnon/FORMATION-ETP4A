require 'csv'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  # Sauvegarde un gossip dans le CSV
 def save
  CSV.open("db/gossip.csv", "ab", quote_char: '"') do |csv|
    csv << [author, content]  # Chaque champ sera correctement encadré
  end
 end


  # Récupère tous les gossips
  def self.all
  all_gossips = []
  CSV.foreach("db/gossip.csv", quote_char: '"') do |row|
    all_gossips << Gossip.new(row[0], row[1])
  end
  return all_gossips
end


  # Supprime un gossip par son index
  def self.destroy(id)
    gossips = self.all
    gossips.delete_at(id - 1)  # Supprime l’élément choisi (index -1 car array commence à 0)

    # Réécrit le CSV avec les gossips restants
    CSV.open("db/gossip.csv", "w") do |csv|
      gossips.each { |gossip| csv << [gossip.author, gossip.content] }
    end
  end
end
