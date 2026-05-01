# 📓 Journal de Bord : Dans la peau d'un Dogsitter Rails

## 🧠 Compréhension : Le pouvoir du "Through"
Ici, la table `Stroll` est le pivot. J'ai compris que sans `has_many :dogs, through: :strolls`, je devrais faire des boucles complexes pour savoir quel chien a été promené par qui. Rails simplifie tout avec une seule ligne de code.

## 🥊 Storytelling : La traque aux erreurs
La gem **Faker** m'a fait une mauvaise blague. J'ai utilisé `Faker::Dog.name` mais le module n'était pas reconnu. Après une recherche "LV2 Bug" sur Google, j'ai découvert que les animaux sont maintenant rangés dans `Faker::Creature::Dog.name`. Une leçon de plus : la doc officielle est ta seule vérité !

## 📜 Liste des commandes exécutées
- `rails new dogstr`
- `rails g model City city_name:string`
- `rails g model Dog name:string city:references` : Utilisation de `references` pour créer l'ID et l'index en une fois.
- `rails g model Stroll date:datetime dogsitter:references dog:references city:references`
- `rails db:migrate`
- `rails db:seed`