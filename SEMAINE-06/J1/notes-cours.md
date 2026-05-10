# 📓 Journal de Bord : Rails Front-End (S6J1)

## 🧠 Ce que j'ai appris
* **Structure MVC** : Le contrôleur est le chef d'orchestre qui demande les données au modèle et les donne à la vue.
* **Syntaxe ERB** : Différence entre `<% %>` (exécute du Ruby) et `<%= %>` (affiche le résultat en HTML).
* **Bootstrap via CDN** : Très pratique pour prototyper rapidement une interface pro sans configurer l'Asset Pipeline lourdement dès le premier jour.

## 🥊 Mes combats (Debug Story)
* **Erreur 406 Not Acceptable** : J'ai découvert que cette erreur survient lorsque Rails ne trouve pas de template correspondant à l'action du contrôleur. La solution est de s'assurer que le fichier `index.html.erb` est bien dans le dossier `app/views/gossips/` [Conversation].
* **Prefixes de routes** : Au début, j'ai confondu l'URL physique et le prefix. `rails routes` m'a permis de voir que pour `/team`, le prefix est `team`, donc le helper est `team_path`.

## 📜 Liste des commandes exécutées
1. `rails new the-big-project -d postgresql` : Création de l'app.
2. `rails generate controller static_pages team contact` : Génération auto des pages statiques.
3. `rails routes` : Pour lister les chemins disponibles.
