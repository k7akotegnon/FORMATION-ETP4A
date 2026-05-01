# 📓 Journal de Bord : L'Architecte des Potins

## 🧠 Concept Avancé : Le défi "Class_name"
Le plus gros morceau a été de lier les messages privés. Comment dire à Rails qu'un `sender` et un `recipient` sont tous les deux des `Users` ? J'ai découvert les options `class_name` et `foreign_key`. C'est là que j'ai compris que Rails est magique, mais qu'il faut parfois lui tenir la main pour qu'il ne se perde pas.

## 🥊 Storytelling : Mon combat contre le code
J'ai passé une heure à comprendre pourquoi `gossip.tags` me renvoyait une erreur. J'avais bien créé la table de jointure `GossipTag`, mais dans mon modèle `Gossip`, j'avais écrit `has_many :tags, through: :gossip_tags` **avant** de déclarer `has_many :gossip_tags`. Rails m'a appris que l'ordre des lignes est primordial [12, 13].

## 📜 Liste des commandes exécutées
- `rails new the_gossip_project`
- `rails g model User first_name:string email:string city:references`
- `rails g model Gossip title:string content:text user:references`
- `rails g model Tag title:string`
- `rails g model GossipTag gossip:references tag:references`
- `rails g model PrivateMessage content:text` : Suivi d'une modification manuelle de la migration pour ajouter `t.references :sender` et `t.references :recipient`.
- `rails db:migrate`
- `rails db:seed`