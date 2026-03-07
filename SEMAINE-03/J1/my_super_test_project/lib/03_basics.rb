# Fonction qui détermine le plus grand nombre parmi a, b et c
def who_is_bigger(a, b, c)
  # Si l'un des paramètres est nil, on retourne "nil detected"
  return "nil detected" if a.nil? || b.nil? || c.nil?

  # On compare les trois valeurs
  if a >= b && a >= c
    "a is bigger"
  elsif b >= a && b >= c
    "b is bigger"
  else
    "c is bigger"
  end
end

# Fonction qui fait des transformations "folles" sur une chaîne
def reverse_upcase_noLTA(str)
  # On inverse la chaîne, on met en majuscules,
  # puis on supprime les lettres L, T et A
  str.reverse.upcase.delete("LTA")
end

# Fonction qui vérifie si un tableau contient le nombre 42
def array_42(array)
  # La méthode include? retourne true si l’élément est présent
  array.include?(42)
end

# Fonction qui applique plusieurs transformations sur un tableau
def magic_array(array)
  array.flatten        # Supprime les sous-tableaux
       .sort           # Trie les éléments
       .map { |n| n * 2 }  # Multiplie chaque nombre par 2
       .reject { |n| n % 3 == 0 } # Supprime les multiples de 3
       .uniq           # Supprime les doublons
       .sort           # Trie à nouveau
end
