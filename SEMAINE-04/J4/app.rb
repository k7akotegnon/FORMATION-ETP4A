require_relative 'lib/game'

# Classe Application : lance le jeu
class Application
  def self.run
    loop do
      game = Game.new
      game.play

      puts "Voulez-vous rejouer ? (o/n)"
      answer = gets.chomp.downcase
      break if answer != "o"
    end
    puts "👋 Merci d'avoir joué au Morpion !"
  end
end

# Lancement du programme
Application.run
