# Classe Player : représente un joueur
class Player
  attr_accessor :name, :symbol

  # Initialisation avec un nom et un symbole ("X" ou "O")
  def initialize(name, symbol)
    @name = name      # Nom du joueur
    @symbol = symbol  # Symbole du joueur
  end
end
