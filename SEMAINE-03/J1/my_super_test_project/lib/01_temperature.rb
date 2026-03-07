# Fonction qui convertit une température en Fahrenheit vers Celsius
def ftoc(fahrenheit)
  # Formule : (F - 32) * 5/9
  # On arrondit le résultat si nécessaire (par exemple pour 98.6°F → 37°C)
  ((fahrenheit - 32) * 5.0 / 9.0).round
end

# Fonction qui convertit une température en Celsius vers Fahrenheit
def ctof(celsius)
  # Formule : (C * 9/5) + 32
  # Ici, on garde les décimales pour des conversions précises (ex: 37°C → 98.6°F)
  (celsius * 9.0 / 5.0) + 32
end
