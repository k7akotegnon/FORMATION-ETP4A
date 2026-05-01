# 📓 Journal de Bord : L'aventure AfrikDoc

## 🧠 Réflexions sur l'Architecture
L'enjeu d'AfrikDoc était de comprendre qu'un docteur ne peut pas simplement avoir une colonne "spécialité" en texte. Pour être pro, il faut une table `Specialties` et une table de jointure. J'ai appris que modéliser sur papier avant de coder permet d'éviter d'oublier des liens vitaux.

## 🥊 Mes combats de "McGyver du dev"
Ma plus grande difficulté a été l'erreur `MissingAttributeError`. J'ai tenté de créer un rendez-vous en console, mais j'avais oublié de lancer `rails db:migrate` après avoir ajouté les `t.belongs_to` dans ma migration. J'ai appris à vérifier systématiquement mon fichier `db/schema.rb` pour voir si les "tuyaux" (IDs) sont bien branchés.

Un autre piège a été la contrainte `NOT NULL`. En voulant ajouter une ville obligatoire à des docteurs existants, SQLite a bloqué. J'ai dû ruser en vidant ma base avec `rails db:migrate:reset` pour repartir sur des plans propres.

## 📜 Liste des commandes exécutées
- `rails new AfrikDoc` : Création de l'espace de travail.
- `rails g model Doctor first_name:string last_name:string` : Génération du premier modèle.
- `rails g model City name:string` : Ajout de la dimension géographique.
- `rails g migration AddCityToDoctors city:references` : Modification d'une table existante pour ajouter une clé étrangère.
- `rails db:migrate:status` : Vérification de l'état des travaux (UP/DOWN).
- `rails db:seed` : Automatisation du remplissage de la base.