require 'colorize'  # On charge la gem colorize

# Classe Show : affiche le plateau avec couleurs
class Show
  def self.display(board)
    system("clear") # Nettoie le terminal

    # Affiche les en-têtes de colonnes en cyan
    puts "   #{'1'.colorize(:cyan)}   #{'2'.colorize(:cyan)}   #{'3'.colorize(:cyan)}"

    # Ligne A
    puts "A  #{colorize_symbol(board.cases["A1"].content)} #{'|'.colorize(:light_black)} #{colorize_symbol(board.cases["A2"].content)} #{'|'.colorize(:light_black)} #{colorize_symbol(board.cases["A3"].content)}"
    puts "  #{'-'.colorize(:cyan) * 3}+#{'-'.colorize(:cyan) * 3}+#{'-'.colorize(:cyan) * 3}"

    # Ligne B
    puts "B  #{colorize_symbol(board.cases["B1"].content)} #{'|'.colorize(:light_black)} #{colorize_symbol(board.cases["B2"].content)} #{'|'.colorize(:light_black)} #{colorize_symbol(board.cases["B3"].content)}"
    puts "  #{'-'.colorize(:cyan) * 3}+#{'-'.colorize(:cyan) * 3}+#{'-'.colorize(:cyan) * 3}"

    # Ligne C
    puts "C  #{colorize_symbol(board.cases["C1"].content)} #{'|'.colorize(:light_black)} #{colorize_symbol(board.cases["C2"].content)} #{'|'.colorize(:light_black)} #{colorize_symbol(board.cases["C3"].content)}"
  end

  # Méthode pour colorer les symboles
  def self.colorize_symbol(symbol)
    case symbol
    when "X"
      symbol.colorize(:red).bold   # X en rouge et en gras
    when "O"
      symbol.colorize(:blue).bold  # O en bleu et en gras
    else
      " "                          # Case vide reste blanche
    end
  end
end
