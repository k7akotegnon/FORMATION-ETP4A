# Fonction qui traduit une phrase en Pig Latin
def translate(sentence)
  vowels = ["a", "e", "i", "o", "u"]

  # On découpe la phrase en mots et on traduit chaque mot
  words = sentence.split.map do |word|
    # Cas où le mot commence par une voyelle
    if vowels.include?(word[0])
      word + "ay"
    else
      # Cas des phonèmes particuliers "qu" et "sch"
      if word.start_with?("qu")
        word[2..-1] + "quay"
      elsif word.start_with?("sch")
        word[3..-1] + "schay"
      else
        # Gestion générale des consonnes
        consonant_cluster = ""
        i = 0
        while !vowels.include?(word[i]) && i < word.length
          # Cas spécial : "qu" après une consonne
          if word[i] == "q" && word[i+1] == "u"
            consonant_cluster += "qu"
            i += 2
          else
            consonant_cluster += word[i]
            i += 1
          end
        end
        word[i..-1] + consonant_cluster + "ay"
      end
    end
  end

  # On recompose la phrase traduite
  words.join(" ")
end
