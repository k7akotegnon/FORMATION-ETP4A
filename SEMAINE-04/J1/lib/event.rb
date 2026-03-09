# On utilise la librairie 'time' pour manipuler les dates et heures facilement
require 'time'

# Définition de la classe Event
class Event
  # Création d'accesseurs pour les attributs de l'événement :
  # - start_date : date et heure de début
  # - duration   : durée en minutes
  # - title      : titre de l'événement
  # - attendees  : liste des participants
  attr_accessor :start_date, :duration, :title, :attendees

  # Méthode d'initialisation appelée lors de la création d'un nouvel événement
  def initialize(start_date, duration, title, attendees = [])
    # Conversion de la date/heure en objet Time pour faciliter les calculs
    @start_date = Time.parse(start_date)
    @duration   = duration
    @title      = title
    @attendees  = attendees
  end

  # Décale l'événement de 24 heures (ajoute 1 jour à la date de début)
  def postpone_24h
    @start_date += 24 * 60 * 60
  end

  # Calcule la date/heure de fin de l'événement
  def end_date
    @start_date + (@duration * 60)
  end

  # Vérifie si l'événement est déjà passé
  def is_past?
    @start_date < Time.now
  end

  # Vérifie si l'événement est dans le futur
  def is_future?
    @start_date > Time.now
  end

  # Vérifie si l'événement commence bientôt (dans les 30 prochaines minutes)
  def is_soon?
    diff = @start_date - Time.now
    diff > 0 && diff <= 30 * 60
  end

  # Affiche les informations de l'événement sous forme lisible
  def to_s
    puts "Titre : #{@title}"
    puts "Date de début : #{@start_date.strftime("%d/%m/%Y %H:%M")}"
    puts "Durée : #{@duration} minutes"
    puts "Invités : #{@attendees.join(", ")}"
  end
end
