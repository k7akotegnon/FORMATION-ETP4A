# 🚀 S6J3 - The Big Project : Full CRUD et Profils

## 📖 Résumé du cours
Cette journée a été consacrée à l'achèvement du cycle CRUD et à l'interconnexion des ressources :
1. **Cycle Update** : Distinction entre l'action `edit` (affichage du formulaire pré-rempli) et `update` (traitement des modifications en base de données).
2. **Action Destroy** : Mise en place de la suppression de ressources via le verbe HTTP DELETE.
3. **Ressources liées** : Création de pages "Show" pour explorer les relations entre les potins, leurs auteurs et leurs villes respectives.

## 💡 Ce que j'ai compris
* **Convention de nommage** : Rails impose une structure stricte pour les méthodes `update` et `destroy` afin de garantir la cohérence du framework.
* **Le rôle du Controller** : Une erreur "undefined method for nil" signifie presque toujours que le contrôleur a oublié d'aller chercher la donnée en base de données avant de l'envoyer à la vue.
* **Rails 8 et Turbo** : Pour les actions de suppression, Rails 8 utilise Turbo, ce qui nécessite l'utilisation de l'attribut `data-turbo-method: :delete` au lieu du simple `method: :delete`.

## 🚀 Le Projet : Full CRUD & Profils
L'objectif était de rendre le "Gossip Project" totalement interactif :
* **CRUD Complet** : Implémentation des fonctionnalités de modification et de suppression des potins.
* **Profils Détaillés** : Création de vues spécifiques pour afficher les informations des utilisateurs et les potins par ville.
* **Navigation fluide** : Interconnexion de toutes les pages via des liens dynamiques utilisant les helpers de path.

## 🛠️ Installation et Prise en main
Pour faire fonctionner ce projet sur votre machine :

1. **Cloner le projet** :

   `git clone https://github.com/k7akotegnon/S6J3-the-big-project.git`
2. **Installer les dépendances** :


   `bundle install`
3. **Configurer la base de données (PostgreSQL)** :
   `rails db:create`

   `rails db:migrate`
4. **Peupler la base de données** :

   `rails db:seed`
5. **Lancer le serveur** :

   `rails s`
6. **Tester l'application** :
   Accédez à `http://localhost:3000`. Vous pouvez désormais créer, lire, modifier et supprimer des potins.

## 🔗 Lien vers le projet
[Accéder au dossier du projet](https://github.com/k7akotegnon/S6J3-the-big-project.git)