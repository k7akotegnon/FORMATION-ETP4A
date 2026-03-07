def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, times = 2)
  Array.new(times, word).join(" ")
end

def start_of_word(word, number)
  word[0, number]
end

def first_word(sentence)
  sentence.split.first
end

def titleize(sentence)
  little_words = ["and", "the", "over"]

  words = sentence.split.map.with_index do |word, index|
    if index == 0
      # Premier mot : toujours capitalisé
      word.capitalize
    elsif little_words.include?(word.downcase)
      # Petits mots ailleurs : forcés en minuscules
      word.downcase
    else
      # Autres mots : capitalisés
      word.capitalize
    end
  end

  words.join(" ")
end

