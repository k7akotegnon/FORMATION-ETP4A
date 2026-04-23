# Mes notes de débutant - S5J1 (Le Web avec Sinatra)

## 1. Sinatra : Le "mini-moteur" de site
J'ai découvert **Sinatra**. C'est comme une boîte à outils qui permet de dire à Ruby : "Hé, si l'utilisateur tape cette adresse dans son navigateur, montre-lui cette page". C'est moins compliqué que l'outil de pro (Rails), donc c'est parfait pour moi pour comprendre comment ça marche "sous le capot".

## 2. L'organisation MVC (Le rangement intelligent)
Au lieu de mettre tout mon code dans un seul gros fichier illisible, je l'ai coupé en 3 morceaux :
- **Le Model (Gossip)** : C'est le cerveau qui s'occupe des données. Il sait comment lire et écrire dans mon fichier de secrets (.csv).
- **La View (ERB)** : C'est ce que l'utilisateur voit (le dessin du site). J'utilise des fichiers `.erb` qui sont du HTML avec un peu de Ruby dedans.
- **Le Controller** : C'est le chef d'orchestre. Il reçoit la demande de l'utilisateur, demande les infos au Model et les donne à la View pour qu'elle les affiche.

## 3. Le fichier config.ru (La clé de contact)
C'est un fichier un peu bizarre, mais indispensable. Il sert juste à démarrer le serveur de façon propre, en séparant le code de mon site du code qui lance le moteur.

## 4. Mes galères de la journée (Apprendre par l'erreur)
- **Le serveur qui ne veut pas s'éteindre** : Parfois, le site reste allumé même si j'ai fermé le terminal. J'ai appris à utiliser la commande `lsof` pour le trouver et `kill` pour le forcer à s'arrêter [Historique conversation].
- **Le format des données** : Au début, les noms s'affichaient avec des crochets bizarres comme `["Paul"]`. J'ai compris que c'était parce que je lisais mal mon fichier CSV et que Ruby croyait que c'était une liste d'un seul nom au lieu du nom tout court.

**Conclusion :** C'est dur, mon cerveau chauffe un peu, mais voir une page web s'afficher grâce à son propre code, c'est super gratifiant !.
