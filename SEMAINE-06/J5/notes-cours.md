# 📓 Journal de Bord : Déploiement & Cookies (S6J5)

## 🧠 Ce que j'ai appris
* **Persistance des sessions** : J'ai compris la différence entre `session` (temporaire, s'efface à la fermeture) et `cookies` (permanent, stocké sur le disque dur).
* **Sécurité par le hash** : On ne stocke jamais l'ID en clair dans un cookie pour éviter le "session hijacking". On utilise un couple `remember_token` (virtuel) et `remember_digest` (haché en base).
* **Hébergement moderne** : Analyse des alternatives à Heroku (qui demande une carte bancaire), notamment Render qui permet un déploiement Git push similaire.

## 🥊 Mes combats (Debug Story)
* **Erreur NoMethodError 'remember_token='** : Mon application a crashé car je n'avais pas déclaré `attr_accessor :remember_token` dans le modèle User. J'ai appris qu'un attribut virtuel doit être explicitement autorisé s'il n'est pas une colonne de la BDD.
* **Le bug du Logout (GET vs DELETE)** : Le bouton déconnexion renvoyait une erreur 404 car il faisait un GET. J'ai dû forcer le verbe DELETE avec `data: { turbo_method: :delete }` pour que Rails 8 comprenne l'action.
* **PostgreSQL Connection Error** : Mon site affichait une erreur 500 sur Render car il cherchait un socket local (`/var/run/postgresql/`). J'ai dû configurer le `DATABASE_URL` dans le tableau de bord Render et m'assurer que `config/database.yml` utilisait bien la variable d'environnement en production.
* **Confusion terminologique** : Clarification sur le fait que nous utilisons du **JavaScript** pour le front-end et non du Java, deux langages totalement différents.

## 📜 Liste des commandes exécutées
1. `rails generate migration add_remember_digest_to_users remember_digest:string`
2. `rails db:migrate`
3. `bundle install --without production` (pour garder SQLite en local et PG en ligne)
4. Configuration des variables d'environnement `DATABASE_URL` et `RAILS_MASTER_KEY` sur Render.
5. `bundle exec rails db:migrate` (via la Build Command de Render)