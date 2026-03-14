# On importe les classes nécessaires
require_relative 'player'
require_relative 'board'
require_relative 'show'
require 'colorize'   # Pour ajouter des couleurs aux messages

# Classe Game : gère une partie de morpion
class Game
  def initialize
    # Demande les noms des joueurs avec couleurs
    puts "Nom du joueur 1 (X) :".colorize(:red).bold
    @player1 = Player.new(gets.chomp, "X")

    puts "Nom du joueur 2 (O) :".colorize(:blue).bold
    @player2 = Player.new(gets.chomp, "O")

    # Initialise le plateau
    @board = Board.new

    # Le joueur courant commence par être le joueur 1
    @current_player = @player1
  end

  # Méthode principale pour jouer une partie
  def play
    loop do
      # Affiche le plateau avec couleurs (via Show)
      Show.display(@board)

      # Demande au joueur courant où il veut jouer
      puts "#{@current_player.name}, choisis une case (ex: A1) :".colorize(:yellow).bold
      move = gets.chomp.upcase

      # Vérifie si le coup est valide
      if @board.play(move, @current_player.symbol)
        # Vérifie si le joueur courant a gagné
        if @board.victory?
          Show.display(@board)
          puts "🎉 #{@current_player.name} a gagné !".colorize(:green).bold
          break
        # Vérifie si le plateau est plein (match nul)
        elsif @board.full?
          Show.display(@board)
          puts "🤝 Match nul !".colorize(:magenta).bold
          break
        else
          # Change de joueur si la partie continue
          switch_player
        end
      else
        # Message si la case est invalide ou déjà occupée
        puts "❌ Coup invalide ou case occupée, réessaie !".colorize(:red).bold
      end
    end
  end

  # Méthode pour changer de joueur
  def switch_player
    # Si le joueur courant est player1, on passe à player2, sinon l’inverse
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end
end
