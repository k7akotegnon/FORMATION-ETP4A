# 🏠 S5J5 - Backend Airbnb (Version 0)

## 📖 Résumé du cours
Cette journée a marqué un tournant professionnel dans mon apprentissage de Rails avec deux concepts majeurs :
1. **PostgreSQL pour la Production** : Abandon de SQLite3 au profit de PostgreSQL, le standard de l'industrie pour les applications en ligne. J'ai appris qu'il ne s'agit plus d'un simple fichier mais d'un **serveur (service)** indépendant avec lequel Rails communique.
2. **Models Robustes (Fat Model, Skinny Controller)** : Application du principe consistant à mettre un maximum de logique et de sécurité dans les modèles Ruby plutôt que dans les contrôleurs. Cela inclut :
    *   **Les Validations** : Pour garantir l'intégrité des données (présence, unicité, format via Regex).
    *   **Les Méthodes d'instance** : Pour ajouter de l'intelligence aux objets (ex: calculer la durée d'un séjour).
    *   **Les Callbacks** : Pour automatiser des actions (ex: envoi d'email après création).

## 💡 Ce que j'ai compris
*   **Intégrité des données** : Les validations sont le dernier rempart avant la base de données. Un modèle bien conçu empêche l'enregistrement de données "sales" (ex: un logement à prix négatif ou un email mal formaté).
*   **Infrastructure** : La gestion d'une base de données de production demande de maîtriser les outils système comme **Homebrew** et les fichiers de configuration comme `database.yml`.
*   **Complexité des Regex** : Les expressions régulières en Ruby sont extrêmement strictes. Une erreur de syntaxe dans une plage de caractères `[]` peut bloquer tout le processus de peuplement de la base (`db:seed`).

## 🚀 Le Projet : Airbnb Backend
L'objectif était de concevoir l'intégralité de la structure de données d'une application type Airbnb avec les modèles suivants :
*   **User** : Propriétaires et invités (validations email et téléphone français).
*   **City** : Villes de France avec validation rigoureuse du code postal.
*   **Listing** : Logements avec description détaillée (>140 caractères) et prix positif.
*   **Reservation** : Séjours avec vérification de la cohérence des dates (la fin après le début).

## 🛠️ Installation et Utilisation
1.  **Démarrer le serveur de données** : `postgres -D /usr/local/var/postgres`
2.  **Installer les dépendances** : `bundle install`
3.  **Créer et migrer la base** : `rails db:create` puis `rails db:migrate`
4.  **Peupler la base via Faker** : `rails db:seed`

## 🥊 Difficultés et Debugging
*   **PostgreSQL Socket Error** : Résolution des problèmes de connexion au socket `/tmp/.s.PGSQL.5432` en passant par un lancement manuel du serveur PostgreSQL sur macOS.
*   **Regex Syntax Error** : Correction de l'erreur `empty range in char class` dans le modèle `City` en rectifiant la plage de caractères autorisée pour les codes postaux.

## 🔗 Lien vers le projet
[Accéder au dossier du projet](https://github.com/k7akotegnon/Airbnb-backend.git)


