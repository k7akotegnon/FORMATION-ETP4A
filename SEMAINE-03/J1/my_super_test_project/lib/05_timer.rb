# Fonction qui convertit un nombre de secondes en format HH:MM:SS
def time_string(seconds)
  # Calcul du nombre d'heures
  hours = seconds / 3600
  # Calcul du nombre de minutes restantes
  minutes = (seconds % 3600) / 60
  # Calcul du nombre de secondes restantes
  secs = seconds % 60

  # Formatage avec deux chiffres par composant (ex: 01:06:40)
  format("%02d:%02d:%02d", hours, minutes, secs)
end
