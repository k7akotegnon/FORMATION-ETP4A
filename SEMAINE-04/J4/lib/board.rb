require_relative 'board_case'

# Classe Board : représente le plateau de jeu
class Board
  attr_accessor :cases

  def initialize
    # On crée les 9 cases du plateau
    @cases = {
      "A1" => BoardCase.new("A1"), "A2" => BoardCase.new("A2"), "A3" => BoardCase.new("A3"),
      "B1" => BoardCase.new("B1"), "B2" => BoardCase.new("B2"), "B3" => BoardCase.new("B3"),
      "C1" => BoardCase.new("C1"), "C2" => BoardCase.new("C2"), "C3" => BoardCase.new("C3")
    }
  end

  # Méthode pour jouer dans une case
  def play(position, symbol)
    if @cases[position].content == " "   # Vérifie si la case est vide
      @cases[position].content = symbol  # Remplit la case avec le symbole du joueur
      return true
    else
      puts "❌ Case déjà occupée !"
      return false
    end
  end

  # Vérifie si un joueur a gagné
  def victory?
    winning_combos = [
      ["A1","A2","A3"], ["B1","B2","B3"], ["C1","C2","C3"], # lignes
      ["A1","B1","C1"], ["A2","B2","C2"], ["A3","B3","C3"], # colonnes
      ["A1","B2","C3"], ["A3","B2","C1"]                    # diagonales
    ]
    winning_combos.any? do |combo|
      values = combo.map { |pos| @cases[pos].content }
      values.uniq.length == 1 && values[0] != " "
    end
  end

  # Vérifie si le plateau est plein
  def full?
    @cases.values.all? { |c| c.content != " " }
  end
end
