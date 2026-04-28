# S5J3 - Dompter les bases de données avec ActiveRecord

## 📝 Présentation du projet
Aujourd'hui, j'ai délaissé les requêtes SQL manuelles pour découvrir la puissance de **Ruby on Rails**. L'objectif était d'apprendre à lier mon code Ruby à une base de données SQLite3 grâce à la gem **ActiveRecord**.

## 🛠 Ce que j'ai réalisé :
1. **Application MYciné** : 
   - Création d'un model `Movie` complet avec des validations.
   - Utilisation de la gem **Faker** pour peupler la base avec 100 films réalistes via le fichier `seeds.rb`.
   - Manipulation des données (CRUD) directement dans la **Rails Console**.
2. **Application Fouta Music** :
   - Mise en place d'une architecture avec deux models : `Album` et `Track`.
   - Remplissage massif de données via un script de seed complexe.
   - Requêtes avancées avec les méthodes `.where`, `.count`, et `.sum`.

## 🎓 Compétences acquises :
- Génération de models et de migrations (`rails g model`).
- Application des "plans d'architecte" à la BDD (`rails db:migrate`).
- Peuplement automatisé de données (`rails db:seed`).
- Utilisation d'ActiveRecord comme traducteur universel entre Ruby et SQL.
