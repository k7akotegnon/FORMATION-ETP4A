# 🔐 S6J4 - The Big Project : Authentification et Sécurité

## 📖 Résumé du cours
Cette journée a marqué le passage à une application sécurisée et personnalisée :
1. **Hachage avec BCrypt** : Utilisation de fonctions cryptographiques pour ne jamais stocker les mots de passe en clair.
2. **Gestion des Sessions** : Utilisation du hash `session` pour que le navigateur se souvienne de l'utilisateur connecté.
3. **Helpers Personnalisés** : Création de méthodes globales comme `current_user` et `logged_in?` pour simplifier le code des vues.
4. **Filtres de Contrôleur** : Utilisation de `before_action` pour restreindre l'accès à certaines pages aux seuls utilisateurs connectés.

## 💡 Ce que j'ai compris
* **password_digest** : C'est la colonne obligatoire en BDD pour que la macro `has_secure_password` fonctionne avec Rails.
* **Portée des variables (Scope)** : L'importance de `current_user` qui évite de refaire des requêtes SQL `User.find` à chaque page.
* **Authenticity Token** : La protection automatique de Rails contre les attaques CSRF dans les formulaires.

## 🚀 Le Projet : Système de Login complet
L'application "The Big Project" permet désormais :
* **Inscription (Sign up)** : Création d'un compte avec mot de passe sécurisé.
* **Connexion (Login)** : Identification via email et vérification du mot de passe via `authenticate`.
* **Auteur Réel** : Les potins ne sont plus créés par "Anonymous" mais rattachés directement à l'ID de la session en cours.

## 🛠️ Installation et Prise en main (Guide pour les nouveaux)
Pour lancer le projet localement :

1. **Cloner le repo** : 

   `git clone [URL]`

2. **Installer les dépendances** : 

   `bundle install`

3. **Base de données** : 

   `rails db:create`

   `rails db:migrate`
4. **Données de test** : 
`rails db:seed` (Crée des utilisateurs avec mots de passe hachés).

5. **Lancer** : 

   `rails s`

6. **Tester** : Allez sur `/users/new` pour créer un compte ou `/sessions/new` pour vous connecter.

## 🔗 Lien vers le projet
[Accéder au dossier du projet](https://github.com/k7akotegnon/S6J4-the-big-project-.git)