# 📓 S5J3 (Rails Models & ActiveRecord)

## 🚀 Le Grand Saut
Après avoir passé la journée d'hier à dompter le SQL "à la main", j'ai eu l'impression aujourd'hui de passer de la charrette à la Formule 1. J'ai découvert **ActiveRecord**, ce traducteur universel qui permet de parler à ma base de données en faisant simplement du Ruby.

## 🏗️ Architecte ou Maçon ?
Ma première grande leçon a été de comprendre la différence entre **créer le plan** et **construire les murs**. 
- Avec `rails generate model`, j'ai dessiné mes plans d'architecte (les fichiers de migration).
- Avec `rails db:migrate`, j'ai envoyé les maçons sur le chantier pour créer réellement les tables dans mon fichier `development.sqlite3`.

**La difficulté du jour :** Au début, je pensais que les fichiers créés étaient déjà ma base de données. J'ai dû apprendre à vérifier le statut de mes travaux avec `rails db:migrate:status` pour voir si mes "plans" étaient bien passés en statut **UP**.

## 🧪 Le Laboratoire Secret (Rails Console)
J'ai passé beaucoup de temps dans la **Rails Console** (`rails c`). C'est mon laboratoire. C'est là que j'ai réalisé mes premiers miracles du **CRUD** : créer un utilisateur en une ligne, le retrouver par son nom avec `.find_by`, ou le supprimer définitivement avec `.destroy`.

## 🌪️ L'Invasion des Clones (Le Seed)
C'est ici que l'aventure est devenue épique. J'ai voulu utiliser l'automate **Seed** et la gem **Faker** pour peupler ma base de 100 films. 

**Ma plus grosse galère :** J'ai lancé mon script plusieurs fois et je me suis retrouvé avec une armée de doublons ! Ma base était saturée. J'ai compris l'importance de la commande de nettoyage : `Movie.destroy_all` au début de mon script pour repartir de zéro à chaque fois. Et pour vraiment tout remettre à plat (même les compteurs d'ID qui s'envolaient), j'ai dû sortir l'artillerie lourde : `rails db:migrate:reset`.

## 🔑 Concepts clés
- **ActiveRecord** : La bibliothèque "magique" qui transforme une table SQL en classe Ruby et les lignes en objets.
- **Migration** : Le "journal de bord" de la structure de ma BDD. Une migration définit ce qui change (ajouter une colonne, créer une table).
- **Model** : Le fichier (ex: `user.rb`) qui contient l'intelligence et les règles métier (validations, associations).
- **Convention over Configuration** : En Rails, le model est au singulier (`User`) et la table est au pluriel (`users`).

## 💻 Commandes indispensables
- `rails new` : Créer l'arborescence du projet.
- `rails db:migrate` : Appliquer les migrations.
- `rails c` : Entrer dans la console pour tester mon code en direct sur les données.
- `rails db:seed` : Exécuter le script de remplissage automatique.
- `rails db:migrate:reset` : Tout effacer et tout reconstruire (pratique pour réinitialiser les IDs).

## 💡 Ce que je retiens
Le développement, ce n'est pas seulement écrire du code qui marche, c'est surtout savoir **pourquoi il ne marche pas** et comment nettoyer ses propres erreurs. J'apprends à aller "molo molo", à lire les messages d'erreur (le langage secret "LV2 bug") et à ne pas paniquer quand un ROLLBACK s'affiche.
