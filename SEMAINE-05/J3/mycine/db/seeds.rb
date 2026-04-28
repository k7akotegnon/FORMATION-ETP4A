# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# On commence par appeler la gem Faker pour avoir accès à ses données aléatoires
require 'faker'

# Étape cruciale : on nettoie la base de données. 
# Cela évite d'accumuler des films à chaque fois que tu relances le seed.

Movie.destroy_all

# On définit les genres autorisés par l'exercice
genres = ["action", "horreur", "comédie", "drame"]

# On lance une boucle pour créer nos 100 films
100.times do
  Movie.create!(
    # Faker propose des noms de films ou de livres plausibles
    name: Faker::Movie.title, 
    
    # On choisit une année au hasard entre 1900 et 2020
    year: rand(1900..2020),
    
    # On pioche un genre au hasard dans notre liste définie plus haut
    genre: genres.sample,
    
    # Le synopsis doit faire au moins 10 mots
    synopsis: Faker::Lorem.sentence(word_count: 10),
    
    # Un nom de réalisateur plausible
    director: Faker::Name.name,
    
    # La note myciné entre 0 et 5 avec un chiffre après la virgule
    # rand(0.0..5.0) génère un nombre décimal, .round(1) l'arrondit à une décimale
    mycine_rating: rand(0.0..5.0).round(1),
    
    # Par défaut, tu ne les as pas encore vus
    already_seen: false,
    
    # Ta note personnelle est vide (nil) pour le moment [8]
    my_rating: nil
  )
end

# Un petit message dans ton terminal pour confirmer que tout s'est bien passé
puts "Félicitations ! 100 films ont été ajoutés à la bibliothèque MYciné."
