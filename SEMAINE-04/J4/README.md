# 🎮 Projet Morpion en Ruby (POO)

## 📖 Introduction
Ce projet consiste à coder le jeu du **Morpion (Tic-Tac-Toe)** en Ruby, en utilisant une approche **100% orientée objet**.  
Le jeu se joue à deux joueurs humains, chacun utilisant un symbole (`X` ou `O`).  
Le programme affiche le plateau, demande aux joueurs où ils souhaitent jouer, détecte les victoires ou les matchs nuls, et propose de rejouer.

---

## 📂 Structure du projet

jeu_morpion/  
├── lib/ 
│   ├── player.rb        # Classe Player  
│   ├── board_case.rb    # Classe BoardCase  
│   ├── board.rb         # Classe Board  
│   ├── game.rb          # Classe Game  
│   └── show.rb          # Classe Show  
├── app.rb               # Classe Application (point d’entrée)  
├── README.md            # Documentation du projet  
├── Gemfile              # Dépendances Ruby  
└── Gemfile.lock  

## ⚙️ Installation

 Installer les dépendances :
  bundle install

Lance le programme principal :
   ruby app.rb

Le jeu démarre et affiche le plateau vide.
Ensuite :

* Le programme demande les noms des deux joueurs.

* Les joueurs jouent à tour de rôle en saisissant une case (ex: A1, B2, C3).

* Le plateau est mis à jour après chaque coup.

* Le jeu détecte automatiquement une victoire ou un match nul.

* À la fin, il propose de rejouer.


🧪 **Fonctionnalités implémentées:**

* Deux joueurs humains (X et O).

* Plateau de 9 cases (A1 à C3).

* Affichage stylisé du plateau dans le terminal.

* Détection de victoire (lignes, colonnes, diagonales).

* Détection de match nul.

* Menu pour rejouer une nouvelle partie.

📦 **Dépendances:**

* bundler → gestion des gems.

* rspec → tests unitaires (optionnel si tu veux tester ton code).

* colorize (optionnel) → pour ajouter des couleurs dans le terminal.
