#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

echo "==> Updating flake inputs..."
nix flake update

if git diff --quiet -- flake.lock; then
  echo "==> flake.lock unchanged — nothing to rebuild."
  exit 0
fi

echo "==> flake.lock changed — rebuilding system..."
if [[ $EUID -eq 0 ]]; then
  nixos-rebuild switch --flake .#nixos
else
  sudo nixos-rebuild switch --flake .#nixos
fi

echo "==> Done."
