# On importe la classe Event définie dans un autre fichier
require_relative 'event'

# Définition de la classe EventCreator
class EventCreator
  # Méthode d'initialisation : elle se lance automatiquement
  # quand on crée un nouvel objet EventCreator
  def initialize
    puts "Salut, tu veux créer un événement ? Cool !"

    # Demande à l'utilisateur le titre de l'événement
    puts "Nom de l'événement ?"
    title = gets.chomp   # gets récupère la saisie clavier, chomp enlève le retour à la ligne

    # Demande la date et l'heure de l'événement
    puts "Quand aura-t-il lieu ? (format AAAA-MM-JJ HH:MM)"
    start_date = gets.chomp

    # Demande la durée en minutes
    puts "Durée (en minutes) ?"
    duration = gets.chomp.to_i   # conversion en entier

    # Demande les participants (emails séparés par ;)
    puts "Participants (sépare les emails par ; )"
    attendees_input = gets.chomp
    attendees = attendees_input.split(";").map(&:strip) 
    # split découpe la chaîne en tableau, map(&:strip) enlève les espaces

    # Création d'un nouvel objet Event avec les infos saisies
    @event = Event.new(start_date, duration, title, attendees)

    puts "Ton évènement a été créé !"
    @event.to_s   # Affiche les détails de l'événement
  end

  # Méthode pour récupérer l'événement créé
  def event
    @event
  end
end
