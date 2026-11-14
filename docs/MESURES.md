# Protocole de mesure (pour la vidéo de démo)

But : des chiffres comparables, pas des impressions. Même machine, mêmes conditions, plusieurs essais.

| Mesure | Comment | Quand |
|---|---|---|
| RAM utilisée au repos | `free -m` | juste après le démarrage |
| Temps de démarrage | `systemd-analyze` | après chaque redémarrage |
| RAM avec/sans mode jeu | `gamemode.csv` (colonnes avant / après) | à chaque lancement avec `zenk-run` |
| FPS / temps de frame | MangoHud (à ajouter) | pendant le jeu |
| Temps de chargement du jeu | chronomètre, 3 essais | avec et sans `zenk-run` |

Machine de référence : PC à 4 Go de RAM. Noter le modèle, le disque (SSD ou HDD) et la version de ZenkOS.
Règle : la version « sans » doit être correctement configurée, pas volontairement bridée.
