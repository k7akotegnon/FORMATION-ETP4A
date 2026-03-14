# Classe BoardCase : représente une case du plateau
class BoardCase
  attr_accessor :position, :content

  # Initialisation avec une position (ex: "A1") et un contenu vide
  def initialize(position)
    @position = position  # Position de la case
    @content = " "        # Contenu par défaut (vide)
  end
end
