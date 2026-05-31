Notes Personnelles - S7J3 : Apprentissages et Défis Techniques
Résumé du cours
Cette journée a marqué le passage à un niveau supérieur de Rails avec l'exploration des fonctionnalités avancées et l'intégration de services tiers. Nous avons étudié :
Les Services (PORO) : L'art de déléguer la logique métier complexe à des objets Ruby simples pour garder les contrôleurs légers.
La gestion des APIs : La sécurisation des clés secrètes via Dotenv et la gestion des variables d'environnement en production.
Stripe : L'implémentation d'un tunnel de paiement sécurisé pour transformer une application en plateforme commerciale.

## Ce que j'ai compris
**Modularité du code :** Un service doit respecter le principe de responsabilité unique (un service = une tâche). On l'appelle généralement avec la méthode .new.perform.

**Sécurité des données :** Le fichier .env est vital pour protéger les clés API (Stripe, etc.) et ne doit jamais quitter la machine locale via Git.

**Tunnel de paiement :** L'importance de la synchronisation entre le front-end (génération du token par Stripe) et le back-end (création de la charge et enregistrement en base de données).

**Environnements de test :** La nécessité d'utiliser les clés pk_test pour simuler des transactions sans utiliser d'argent réel.
Difficultés rencontrées et Apprentissages

1. **Le blocage de la Tokenisation Stripe**

    **Problème :** Message d'erreur "This integration surface is unsupported for publishable key tokenization". 

    **Apprentissage :** Les nouveaux comptes Stripe bloquent par défaut l'ancienne méthode de script checkout.js. 

    **Solution :** J'ai appris qu'il faut activer manuellement l'option Legacy Checkout ou Client-side tokenization dans les paramètres d'intégration du Dashboard Stripe.

2. **Automatisation des migrations sur Render Free**

    **Problème :** Les nouvelles tables (attendances) ou colonnes (stripe_customer_id) ne se créaient pas automatiquement au déploiement. 

    **Apprentissage :** Sur le plan gratuit de Render, on ne peut pas utiliser la commande **Pre-deploy**. 

    **Solution :** J'ai appris à coupler les commandes dans le champ Start Command du dashboard Render :` bundle exec rails db:migrate && bundle exec puma -t 5:5 -p ${PORT:-3000} -e production`.

3. **Sémantique des relations (Participants vs Users)**

    **Problème :** Confusion lors de l'appel de @event.users.  

    **Apprentissage :** Pour un code plus pro et explicite, il vaut mieux renommer la relation.

    **Solution :** Utilisation de `has_many :participants, through: :attendances, source: :user` dans le modèle Event pour rendre le code beaucoup plus lisible.

4. **Persistance des variables d'environnement**

    **Problème :** Les clés Stripe n'étaient pas reconnues après modification du `.env`. 

    **Apprentissage :** Rails ne charge le fichier `.env` qu'au démarrage.

    **Solution :** Toujours redémarrer le serveur Rails (rails server) après toute modification des clés secrètes.