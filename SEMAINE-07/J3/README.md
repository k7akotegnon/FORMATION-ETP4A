# S7J3 - Projet EventFreeka : Services et Paiement Stripe

## 📖 L'Essentiel : professionnalisation et monétisation

L'objectif central de cette étape est l'ouverture de l'application vers des services tiers et la mise en place d'un système de monétisation sécurisé. En intégrant Stripe, nous transformons EventFreeka en une véritable plateforme commerciale capable de gérer des transactions réelles. L'introduction des Services (PORO) permet de maintenir une architecture propre en isolant la logique métier complexe (comme les appels API) en dehors des contrôleurs. Cette approche garantit une application évolutive où la gestion des clés secrètes et les interactions externes sont normalisées selon les standards de l'industrie.

## 🛠️ **Guide d'installation**

Ce guide détaille les étapes pour configurer l'intégration Stripe et lancer le projet avec ses nouvelles fonctionnalités de paiement.
1. **Prérequis**
Assurez-vous d'avoir les versions suivantes installées : 

    Ruby (version spécifiée dans le Gemfile)

    Rails 7.x

    Compte Stripe (en mode Test)

2. **Installation des dépendances**
Installez les nouvelles gems nécessaires à l'intégration API :

    `bundle install`

3. **Configuration des variables d'environnement**
Créez un fichier .env à la racine pour stocker vos clés API Stripe :
    `STRIPE_PUBLISHABLE_KEY=pk_test_...`
    `STRIPE_SECRET_KEY=sk_test_...`

    Important : Vérifiez que le fichier `.env` est listé dans votre `.gitignore`.

4. **Configuration de la base de données**
Appliquez les migrations pour ajouter la table des participations et l'identifiant Stripe :

    `rails db:migrate`

    Note pour la production (Render) : La migration s'exécute via la commande combinée dans le champ **Start Command**.

5. **Peuplement de la base (Seed)**
Pour tester le tunnel d'achat avec des événements existants :
`rails db:seed`

6. **Lancement du serveur**. 

    `rails server`. 

    L'application et le formulaire de paiement seront accessibles sur http://localhost:3000.

## **Lien vers le projet**

[Accéder au dossier projet](Lien GitHub) 

[Event freeka S7J3 en ligne](Lien Render)