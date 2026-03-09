# On utilise les librairies 'time' et 'date' pour manipuler les dates et heures
require 'time'
require 'date'

# Définition de la classe DateParser
class DateParser
  # Méthode de classe (self.parse) qui prend une chaîne en entrée
  def self.parse(input)
    # Expression régulière pour reconnaître le format :
    # "le [jour] [mois] à [heure] h [minute]"
    if input =~ /le (\d{1,2}) (\w+) à (\d{1,2}) h(?: (\d{1,2}))?/
      day = $1.to_i          # Jour (ex: 14)
      month_name = $2.downcase # Nom du mois en minuscules (ex: "octobre")
      hour = $3.to_i         # Heure (ex: 15)
      minute = $4 ? $4.to_i : 0 # Minute (optionnelle, par défaut 0)

      # Dictionnaire des mois en français → numéro du mois
      months = {
        "janvier" => 1, "février" => 2, "mars" => 3, "avril" => 4,
        "mai" => 5, "juin" => 6, "juillet" => 7, "août" => 8,
        "septembre" => 9, "octobre" => 10, "novembre" => 11, "décembre" => 12
      }

      # Conversion du nom du mois en numéro
      month = months[month_name]

      # On suppose que l'année est l'année courante
      year = Date.today.year

      # Création d'un objet Time avec les infos extraites
      Time.new(year, month, day, hour, minute)
    else
      # Si la chaîne ne correspond pas au format attendu
      puts "Format non reconnu. Utilise : 'le [jour] [mois] à [heure] h [minute]'"
      nil
    end
  end
end
