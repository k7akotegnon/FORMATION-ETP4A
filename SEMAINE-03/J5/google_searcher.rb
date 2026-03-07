# google_searcher.rb
# Ce programme ouvre une recherche Google directement dans ton navigateur

# On importe la gem Launchy qui permet d’ouvrir des URLs dans le navigateur
require 'launchy'

# On récupère les arguments passés au programme (ARGV est un tableau)
query = ARGV.join(" ")

# Si aucun argument n’est donné, on explique à l’utilisateur comment utiliser le programme
if query.empty?
  puts "Utilisation : ruby google_searcher.rb votre recherche"
  exit
end

# On construit l’URL Google en remplaçant les espaces par des +
url = "https://www.google.com/search?q=#{query.gsub(" ", "+")}"

# On ouvre l’URL dans le navigateur par défaut
Launchy.open(url)
