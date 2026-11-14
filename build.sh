#!/usr/bin/env bash
# Construit l'ISO de ZenkOS. À lancer sur Debian/Ubuntu (VM ou machine réelle) : sudo ./build.sh
set -euo pipefail
cd "$(dirname "$0")/iso"

[[ $EUID -eq 0 ]] || { echo "Lance ce script avec sudo : sudo ./build.sh" >&2; exit 1; }
command -v lb >/dev/null || { echo "Installe live-build : sudo apt install live-build" >&2; exit 1; }

lb clean || true
lb config
lb build 2>&1 | tee build.log

iso=$(ls -1 live-image-*.iso 2>/dev/null | head -n1 || true)
[[ -n $iso ]] || { echo "Aucune ISO produite, voir iso/build.log" >&2; exit 1; }
mv "$iso" zenkos-0.1-amd64.iso
sha256sum zenkos-0.1-amd64.iso | tee zenkos-0.1-amd64.iso.sha256
echo "OK : iso/zenkos-0.1-amd64.iso"
