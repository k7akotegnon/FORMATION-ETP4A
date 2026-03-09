# On utilise la librairie 'date' pour manipuler les dates facilement
require 'date'

# Définition de la classe CalendarDisplayer
class CalendarDisplayer
  # Initialisation avec une liste d'événements
  def initialize(events)
    @events = events   # Tableau d'objets Event
  end

  # Méthode pour afficher le calendrier ASCII d'un mois donné
  def display(month, year)
    # Nombre de jours dans le mois (exemple : 31 pour mars)
    days_in_month = Date.new(year, month, -1).day

    # En-tête du calendrier
    puts "Calendrier du mois #{month}/#{year}"
    puts "--------------------------------------"

    # Boucle sur chaque jour du mois
    (1..days_in_month).each do |day|
      date = Date.new(year, month, day)

      # Sélection des événements qui tombent ce jour-là
      day_events = @events.select { |event| event.start_date.to_date == date }

      # Affichage du jour avec un format fixe
      print "| #{day.to_s.ljust(2)} "

      # Si des événements existent, on affiche leur nombre
      if day_events.any?
        print "#{day_events.size} event(s)"
      else
        # Sinon, on laisse un espace vide
        print "          "
      end

      # Fin de la ligne
      print " |\n"
    end

    # Ligne de fin du calendrier
    puts "--------------------------------------"
  end
end
