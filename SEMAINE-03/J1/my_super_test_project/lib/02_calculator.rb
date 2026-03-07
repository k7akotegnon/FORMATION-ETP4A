# Fonction qui additionne deux nombres
def add(a, b)
  a + b
end

# Fonction qui soustrait deux nombres
def subtract(a, b)
  a - b
end

# Fonction qui calcule la somme des éléments d'un tableau
def sum(array)
  # La méthode .sum existe en Ruby >= 2.4
  # Pour compatibilité, on peut utiliser inject
  array.inject(0) { |total, n| total + n }
end

# Fonction qui multiplie deux nombres
def multiply(a, b)
  a * b
end

# Fonction qui élève un nombre à la puissance d'un autre
def power(a, b)
  a ** b
end

# Fonction qui calcule la factorielle d'un nombre
def factorial(n)
  # Cas de base : 0! = 1
  return 1 if n == 0
  # Produit des entiers de 1 à n
  (1..n).inject(1) { |product, i| product * i }
end
