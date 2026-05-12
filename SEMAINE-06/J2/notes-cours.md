# 📓 Journal de Bord : REST & Formulaires (S6J2)

## 🧠 Ce que j'ai appris
* **Flux de données** : J'ai compris le cycle complet : l'utilisateur remplit un formulaire -> les données passent dans `params` -> le contrôleur les récupère -> le modèle les valide et les enregistre.

* **Sécurité CSRF** : Rails exige un `authenticity_token` dans chaque formulaire pour empêcher les attaques malveillantes.

* **Associations ActiveRecord** : La contrainte "User must exist" m'a forcé à comprendre que chaque objet doit respecter ses liens en base de données avant d'être sauvegardé.

## 🥊 Mes combats (Debug Story)
* **L'erreur "User must exist"** : Mon formulaire restait bloqué sur la page `new`. En inspectant `@gossip.errors` dans la console, j'ai vu que l'utilisateur "Anonymous" ne pouvait pas être créé car il lui manquait une ville (`City`).

* **Correction** : J'ai dû créer une instance de `City` en premier lieu dans la console rails, puis créer l'utilisateur rattaché à cette ville. Une fois cette hiérarchie respectée, l'enregistrement des potins est devenu fluide.

* **Syntaxe de resources** : J'ai appris à utiliser `only:` pour limiter les routes générées et garder un fichier `routes.rb` propre.

## 📜 Liste des commandes exécutées
1. `cp -r S6J1/projet S6J2/projet` : Duplication du travail de la veille (S6J1/projet).
2. `rails generate model City name:string zip_code:string` : Création du modèle pour les villes.
3. `rails db:migrate` : Mise à jour de la structure PostgreSQL.
4. `rails console` : Utilisation pour créer manuellement la première ville et l'utilisateur "Anonymous".
5. `rails routes` : Vérification des nouveaux chemins CRUD générés par `resources`.
