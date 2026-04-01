require 'csv'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
  CSV.open("./db/gossip.csv", "ab", col_sep: ",", quote_char: '"') do |csv|
    csv << [author, content]
  end
end


  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |row|
      all_gossips << Gossip.new(row[0], row[1])
    end
    return all_gossips
  end

  # Nouvelle méthode pour supprimer un gossip par son index
  def self.delete(id)
    gossips = CSV.read("./db/gossip.csv")
    gossips.delete_at(id - 1)  # id commence à 1, array à 0
    CSV.open("./db/gossip.csv", "w") do |csv|
      gossips.each { |row| csv << row }
    end
  end

  def self.update(id, author, content)
  gossips = CSV.read("./db/gossip.csv")
  gossips[id - 1] = [author, content]   # remplace la ligne
  CSV.open("./db/gossip.csv", "w") do |csv|
    gossips.each { |row| csv << row }
  end
end

end
