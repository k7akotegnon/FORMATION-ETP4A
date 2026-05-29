# Notes Personnelles - S7J2 : Apprentissages et Défis Techniques

## Résumé du cours
Cette journée a été centrée sur l'écosystème **Devise**, le moteur d'authentification de référence pour Ruby on Rails. Nous avons exploré ses modules clés :
- **Database Authenticatable** : Pour le stockage haché des mots de passe.
- **Registerable** : Pour la gestion complète des comptes via formulaires.
- **Recoverable & Rememberable** : Pour la réinitialisation de mots de passe et la persistance des sessions via cookies.
En parallèle, nous avons appris à structurer une interface globale cohérente en utilisant le fichier `application.html.erb` et les **partials** pour les composants récurrents comme la Navbar et les messages flash.

## Ce que j'ai compris
- **Intégrité de la BDD** : L'utilisation de `change_table` lors de l'ajout de Devise sur un modèle existant est cruciale pour éviter les conflits de colonnes (`email`, `encrypted_password`).
- **Filtrage des accès** : Le helper `authenticate_user!` permet une sécurisation granulaire des routes directement dans les contrôleurs.
- **UI Dynamique** : Les méthodes `user_signed_in?` et `current_user` sont les piliers d'une interface qui s'adapte en temps réel à l'état de l'utilisateur.
- **Strong Parameters** : La nécessité de "sanitizer" les paramètres personnalisés (`first_name`, `last_name`) dans le `ApplicationController` pour autoriser leur enregistrement par Devise.

## Difficultés rencontrées et Apprentissages

### 1. La "Guerre des Routes" (Duplicate Route Error)
**Problème :** Erreur `Invalid route name, already in use: 'new_user_session'`.
**Apprentissage :** Causé par une double déclaration de `devise_for :users` dans le fichier `routes.rb`. Devise génère automatiquement une dizaine de routes ; toute répétition crée un conflit de préfixe.
**Solution :** Nettoyage rigoureux du routeur pour ne garder qu'une seule instance de la déclaration.

### 2. Collision de Génération (Controller déjà existant)
**Problème :** Échec de la commande `rails generate controller Events` car le fichier existait déjà.
**Solution :** Utilisation de l'option `--force` pour écraser proprement ou ajout manuel des méthodes CRUD pour respecter les conventions REST sans briser le code existant.

### 3. L'énigme du Template Manquant
**Problème :** Erreur `MissingExactTemplate` sur l'action `new`.
**Apprentissage :** Dans Rails, chaque méthode de contrôleur cherche par défaut une vue portant exactement le même nom dans le dossier `app/views/`. J'avais codé la logique mais oublié de créer physiquement le fichier HTML correspondant.

### 4. Le piège des Strong Parameters
**Problème :** Erreur `NameError` sur `event_params`.
**Apprentissage :** Pour des raisons de sécurité, Rails interdit l'envoi direct de données brutes en base (Mass Assignment). Il faut définir une méthode `private` pour lister explicitement les champs autorisés.

### 5. ParameterMissing : form_tag vs form_for
**Problème :** Erreur `ActionController::ParameterMissing - param is missing or the value is empty: event`.
**Apprentissage :** `form_tag` envoie les données en vrac, tandis que `form_for` les encapsule dans un hash (ex: `params[:event][:title]`). Mon contrôleur attendait une structure imbriquée que seul `form_for` ou `form_with` peut fournir correctement.
**Solution :** Refactorisation du formulaire pour utiliser `form_for(@event)`.

### 6. Configuration SMTP et Action Mailer
**Apprentissage :** Devise nécessite une configuration précise de `default_url_options` pour générer les liens de récupération de compte. J'ai appris à différencier ces réglages entre le `localhost` et la production sur Render/Neon pour garantir un service d'emailing fonctionnel dès le déploiement.

### 7. Le défi de la délivrabilité : Gmail et les nouvelles normes (DKIM/DMARC)
**Problème** : L'application signale que l'e-mail est "délivré" (statut Brevo), mais rien n'apparaît dans la boîte de réception Gmail, pas même dans les spams.
**Apprentissage** : Depuis début 2024, Google, Yahoo et Microsoft ont durci leurs règles de sécurité. Ils exigent désormais que les services d'envoi (comme Brevo) prouvent mathématiquement qu'ils ont le droit d'envoyer des e-mails en ton nom.
* **Usurpation d'identité :** Si le code Rails utilise `default from: 'ton-email@gmail.com'` alors que l'e-mail sort des serveurs de Brevo, Gmail bloque purement et simplement le message pour suspicion de phishing.

* **Authentification nécessaire :** Pour une fiabilité totale, il faudrait posséder un nom de domaine propre (ex: `.com`) et configurer les clés DKIM (signature numérique) et DMARC (politique de sécurité) dans les paramètres DNS.

**Solutions et contournements pour le projet :**
* **Validation de l'expéditeur :** J'ai appris qu'il est impératif de valider manuellement son adresse Gmail directement dans l'interface de Brevo ("Expéditeurs & IP") pour que le serveur accepte de relayer le message.
- **Le recours à Yopmail :** Pour les tests de production, les adresses `@yopmail.com` sont salvatrices. Elles n'appliquent pas de filtres de sécurité drastiques, ce qui permet de valider que la "chaîne" (Rails → Brevo → Destinataire) fonctionne sans être bloqué par les algorithmes de Google.
* **Le Bypass via Seeds :** En cas de blocage persistant en production, j'ai découvert qu'on peut "forcer" la confirmation d'un compte en base de données via une commande `user.confirm` dans le fichier `seeds.rb`, évitant ainsi d'attendre un e-mail qui ne viendra jamais.
