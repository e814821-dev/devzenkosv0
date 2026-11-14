# ZenkOS

Linux complet et léger (Debian 13 + XFCE), pensé pour bien jouer sur des PC modestes.
Version actuelle : **0.1 alpha**, sans IA. Le but : mesurer d'abord, optimiser ensuite.

## Construire l'ISO

**Option A : dans le cloud (aucune machine Linux nécessaire)**
1. Crée un dépôt sur GitHub et envoie-y ce dossier.
2. Onglet **Actions** → « Construire l'ISO ZenkOS » → **Run workflow**.
3. Télécharge l'ISO dans les *artifacts* une fois terminé (compter 20 à 40 min).

**Option B : sur Debian/Ubuntu (VM ou machine réelle)**
```
sudo apt install live-build
sudo ./build.sh
```
L'ISO apparaît dans `iso/zenkos-0.1-amd64.iso`. Compter ~10 Go d'espace libre.

## Tester
Démarre l'ISO dans une machine virtuelle (VirtualBox, QEMU) ou écris-la sur une clé USB (Ventoy, balenaEtcher).
Session live : utilisateur `zenk` (mot de passe habituel des images live : `live`).

## Mode jeu léger
Dans Steam, options de lancement d'un jeu : `zenk-run %command%`
Ou dans un terminal : `zenk-run ./mon-jeu`

## Structure
- `iso/auto/config` : réglages de l'image (base, paquets firmware, langue)
- `iso/config/package-lists/` : paquets installés
- `iso/config/includes.chroot/` : fichiers copiés tels quels dans le système
- `iso/config/hooks/` : petits scripts exécutés pendant la construction
- `docs/` : architecture, protocole de mesure, feuille de route

## Limites connues de la v0.1
- Pas de pilote NVIDIA propriétaire (pilote libre `nouveau` seulement)
- Pas encore de Steam préinstallé (demande l'architecture i386, prévu ensuite)
- Installateur : celui de Debian, pas encore personnalisé
- Secure Boot : non testé (désactive-le dans le BIOS/VM pour essayer la v0.1)
