# 📓 Journal de Bord : Mes Combats avec Action Mailer (S7J1)

## 🧠 Ce que j'ai appris
* **Héritage de Mailer** : `UserMailer` hérite de `ApplicationMailer`, ce qui permet de définir des expéditeurs par défaut (`default from: ...`).
* **Variables d'environnement** : En production, les secrets (clés d'API) ne doivent jamais être sur GitHub. L'hébergeur (Railway/Render) sert de coffre-fort via les "Config Vars".

## 🥊 Mes combats (Debug Story)
* **L'erreur `PG::UndefinedTable`** : Lors de la migration, Rails cherchait une table `administrators`. J'ai dû modifier la migration pour préciser `{ to_table: :users }` afin de lier l'administrateur à la table des utilisateurs.
* **Erreur `Missing template`** : Mon premier test a échoué avec un `ROLLBACK` car mes fichiers de vue étaient vides ou mal nommés. Rails annule la création de l'objet en BDD si l'envoi du mail (lié au callback) échoue.
* **Problème `administrator_id`** : Dans le modèle `Event`, j'ai dû ajouter `belongs_to :administrator, class_name: "User"` pour que Ruby comprenne que l'administrateur est un utilisateur, malgré le nom de colonne différent.
* **Onglet invisible `letter_opener`** : J'ai appris que les bloqueurs de fenêtres surgissantes peuvent empêcher l'ouverture des mails de test. Il faut vérifier les paramètres du navigateur ou regarder dans `tmp/letter_opener`.

## 📜 Liste des commandes exécutées
1. `rails new event_freeka -d postgresql`
2. `rails generate model User ...`
3. `rails generate model Event ... administrator:references`
4. `rails generate model Attendance ...`
5. `rails generate mailer UserMailer`
6. `bundle install`
7. `rails db:migrate`
8. `rails db:seed`