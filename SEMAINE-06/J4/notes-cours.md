# 📓 Journal de Bord : Authentification (S6J4)

## 🧠 Ce que j'ai appris
* **Logique de Session** : Le hash `session` est stocké côté client mais géré par Rails pour maintenir l'état de connexion.
* **BCrypt & Sécurité** : Ne jamais faire confiance à l'entrée utilisateur. Rails gère la comparaison des hashs via la méthode `.authenticate`.
* **Inclusion de Helpers** : Inclure un module dans `ApplicationController` permet de rendre ses méthodes disponibles dans tous les autres contrôleurs et toutes les vues.

## 🥊 Mes combats (Debug Story)
* **L'erreur de déconnexion** : J'ai compris que le bouton Logout envoyait un GET au lieu d'un DELETE. L'ajout de `data: { turbo_method: :delete }` est obligatoire depuis Rails 7/8 pour que Turbo intercepte la requête.
* **L'inscription bloquée** : J'ai dû implémenter manuellement les méthodes `new` et `create` dans le `UsersController` pour traiter les données du formulaire d'inscription.

## 📜 Liste des commandes exécutées
1. `bundle install` (après avoir décommenté bcrypt).
2. `rails generate migration add_password_to_users password_digest:string`.
3. `rails db:migrate`.
4. `rails generate controller sessions new create destroy`.