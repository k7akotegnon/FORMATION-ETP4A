# 🚀 S6J2 - The Big Project : Architecture REST et Formulaires

## 📖 Résumé du cours
Cette journée a été consacrée à la standardisation de l'application selon les conventions professionnelles du framework Rails :
1. **Architecture REST** : Compréhension des 7 types de requêtes standards pour manipuler une ressource (index, show, new, create, edit, update, destroy).
2. **Routage Automatisé** : Utilisation de la commande `resources :gossips` qui génère automatiquement les routes CRUD sécurisées.
3. **Formulaires Rails** : Mise en place de formulaires HTML via le helper `form_tag` pour envoyer des données au serveur.
4. **Validations de Modèles** : Sécurisation de l'intégrité des données (présence, longueur) directement dans le code Ruby du modèle.

## 💡 Ce que j'ai compris
* **Fat Model, Skinny Controller** : La logique métier et la validation appartiennent au modèle. Le contrôleur doit rester léger et se limiter à l'aiguillage.
* **Le hash params** : C'est le réceptacle universel des données envoyées par l'utilisateur, que ce soit via l'URL ou un formulaire.
* **Render vs Redirect** : `render` affiche une vue en conservant les variables d'instance (pratique pour afficher les erreurs), tandis que `redirect_to` crée une toute nouvelle requête HTTP.

## 🚀 Le Projet : Création de Potins
L'objectif était de permettre aux utilisateurs de contribuer dynamiquement au "Gossip Project" :
* **Page de création** : Implémentation d'une vue `new` avec un formulaire de saisie (titre et contenu).
* **Gestion du succès/échec** : Redirection vers l'accueil en cas de succès, ou réaffichage du formulaire avec messages d'erreurs détaillés en cas d'échec des validations.
* **Système d'alertes** : Intégration de bandeaux de notifications (Flash messages) pour confirmer les actions de l'utilisateur.

## 🛠️ Installation et Prise en main (Guide pour les nouveaux)
Pour faire fonctionner ce projet sur votre machine, suivez ces étapes :

1. **Cloner le projet** :

   `git clone [URL_DU_REPO]`
2. **Installer les dépendances** :

   `bundle install`
3. **Configurer la base de données (PostgreSQL)** :

   `rails db:create`

   `rails db:migrate`

4. **Peupler la base de données** :

   `rails db:seed`

   *(Note : Le seed crée automatiquement l'utilisateur "Anonymous" nécessaire à la création de potins sans compte).*

5. **Lancer le serveur** :

   `rails s`

6. **Tester l'application** :
   Rendez-vous sur `http://localhost:3000` pour voir les potins ou sur `http://localhost:3000/gossips/new` pour en créer un.

## 🔗 Lien vers le projet
[Accéder au dossier du projet](https://github.com/k7akotegnon/S6J2-the-big-project.git)
