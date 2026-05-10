# 🚀 S6J1 - The Big Project : Routage et Premières Vues

## 📖 Résumé du cours
Cette journée a marqué le passage au "front-end" avec Ruby on Rails, en complétant le modèle **MVC** (Modèle-Vue-Contrôleur). Les concepts clés abordés ont été :
1. **Le Routage Centralisé** : Contrairement à Sinatra, toutes les routes sont regroupées dans `config/routes.rb`, servant d'aiguilleur pour l'application.
2. **Les Routes Dynamiques** : Utilisation des symboles `:` dans les URLs pour capturer des variables (ex: `:first_name`) transmises au contrôleur via le hash `params`.
3. **Les Helpers de Liens** : Remplacement des balises `<a>` par le helper `<%= link_to %>` associé aux **paths** (ex: `root_path`), garantissant un code plus propre et maintenable.

## 💡 Ce que j'ai compris
* **Convention Over Configuration** : Rails s'attend à ce qu'une action de contrôleur (ex: `index`) corresponde exactement à un fichier de vue (`index.html.erb`) dans un dossier au nom du contrôleur.
* **La puissance du hash `params`** : C'est l'outil indispensable pour récupérer des données provenant directement de l'URL saisie par l'utilisateur.
* **L'importance de `rails routes`** : Cette commande est la carte d'identité du projet, permettant de connaître les prefixes de chaque route pour construire les liens.

## 🚀 Le Projet : The Big Project (V1)
L'objectif était de lancer les fondations de l'application de potins en intégrant le backend précédemment construit :
* **Pages Statiques** : Création des pages "L'Équipe" et "Contact" avec des composants **Cards Bootstrap**.
* **Bienvenue Dynamique** : Une route `/welcome/:first_name` qui salue l'utilisateur par son prénom.
* **Index des Potins** : La page d'accueil affiche désormais dynamiquement tous les gossips de la base de données PostgreSQL.
* **Pages Show** : Mise en place des profils détaillés pour chaque potin et chaque utilisateur.

## 🛠️ Installation et Utilisation
1. **Démarrer PostgreSQL** : `postgres -D /usr/local/var/postgres`.
2. **Installer les dépendances** : `bundle install`.
3. **Initialiser la base** : `rails db:create`, `rails db:migrate`, puis `rails db:seed`.
4. **Lancer le serveur** : `rails s`.

## 🔗 Lien vers le projet
[Accéder au dossier du projet](https://github.com/k7akotegnon/S6J1-the-big-project.git)
