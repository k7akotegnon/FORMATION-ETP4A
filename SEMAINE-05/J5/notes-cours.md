
# 📓 Journal de Bord : Airbnb Backend (S5J5)

## 🧠 Ce que j'ai appris
Aujourd'hui, j'ai franchi l'étape de la production en passant de SQLite à **PostgreSQL**. J'ai appris que PostgreSQL n'est pas un simple fichier mais un **serveur (service)** qui doit être actif pour que Rails puisse communiquer avec lui via le socket `/tmp/.s.PGSQL.5432`.
J'ai également renforcé mes modèles avec des **validations** (Fat Model) pour garantir l'intégrité des données (email unique, prix positif, format de code postal).

## 🥊 Mes combats (Debug Story)
1. **L'initialisation de PostgreSQL** : Mon plus gros défi a été le démarrage du service sur macOS. J'ai dû passer par un lancement manuel via `postgres -D /usr/local/var/postgres` pour contourner les erreurs de bootstrap de Homebrew et rendre la base prête à accepter des connexions.
2. **Syntaxe des Regex** : J'ai lutté contre l'erreur `empty range in char class`. J'ai compris que dans les crochets `[]`, Ruby attend des caractères et non des plages de nombres comme `12-19`, ce qui rendait ma validation de code postal invalide.

## 📜 Liste des commandes exécutées
1. `rails new -d postgresql airbnb` : Création de l'app optimisée pour la prod.
2. `postgres -D /usr/local/var/postgres` : Lancement manuel du serveur de données.
3. `rails db:create` : Création de l'espace de stockage sur le serveur.
4. `rails db:migrate` : Création des tables `users`, `cities`, `listings` et `reservations`.
5. `rails db:seed` : Génération de données de test avec la gem Faker.
