# mkdiruby.rb
# Ce programme crée un dossier Ruby complet avec la structure de base

# On récupère l’argument (nom du projet)
project_name = ARGV[0]

# Vérification : il faut exactement un argument
if ARGV.size != 1
  puts "Utilisation : ruby mkdiruby.rb nom_du_projet"
  exit
end

# Création du dossier principal
Dir.mkdir(project_name) unless Dir.exist?(project_name)
Dir.chdir(project_name)

# Création du Gemfile avec les gems de base
File.open("Gemfile", "w") do |f|
  f.puts "source 'https://rubygems.org'"
  f.puts "gem 'rspec'"
  f.puts "gem 'dotenv'"
end

# Initialisation Git
system("git init")

# Création du fichier .env et ajout au .gitignore
File.open(".env", "w") {}
File.open(".gitignore", "w") { |f| f.puts ".env" }

# Création du dossier lib
Dir.mkdir("lib") unless Dir.exist?("lib")

# Initialisation RSpec
system("rspec --init")

# Création du README
File.open("README.md", "w") do |f|
  f.puts "# #{project_name}"
  f.puts "Ce projet est une application Ruby."
end

puts "Projet Ruby '#{project_name}' créé avec succès !"
