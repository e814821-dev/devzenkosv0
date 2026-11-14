# Architecture de ZenkOS (v0.1)

## Base
Debian 13 « trixie » + XFCE, construite avec `live-build`. Noyau 6.12 (eBPF, sched_ext disponibles pour plus tard).

## Trois couches (objectif)
1. **IA d'optimisation** : droits minimaux, bac à sable, liste fermée d'actions. *(pas encore écrite)*
2. **Gardien** : règles fixes, indépendant de l'IA, signé, en lecture seule. *(pas encore écrit)*
3. **Noyau Linux** : impose les limites (cgroups, seccomp, AppArmor).

## Ce qui existe déjà (v0.1, sans IA)
- `zram` (RAM compressée, zstd, 50 %) + réglages mémoire (`99-zenkos.conf`)
- Garantie mémoire souple pour les services système (`MemoryLow=512M`, à mesurer)
- `earlyoom` contre les blocages mémoire
- **Mode jeu léger** : `zenk-run %command%`
  - coupe une liste FERMÉE de services (`/etc/zenkos/gamemode-services.list`, root seulement)
  - restaure tout à la fin, même si le jeu plante ; filet de sécurité automatique après 4 h
  - n'utilise sudo que pour 2 commandes exactes (`zenk-services stop|start`)
  - journal des mesures : `~/.local/share/zenkos/gamemode.csv`

## Règles de sécurité à respecter dès maintenant
- Toute action privilégiée passe par une liste fermée, jamais par une commande libre.
- Les fichiers de configuration privilégiés appartiennent à root.
- Rien ne sort de la machine : pas de télémétrie.
