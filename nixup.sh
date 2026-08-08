#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

echo "==> Updating flake inputs..."
nix flake update

if git diff --quiet -- flake.lock; then
  echo "==> flake.lock unchanged — nothing to rebuild."
  exit 0
fi

echo "==> Building new system (no switch yet)..."
nixos-rebuild build --flake .#nixos

echo "==> Package changes:"
nvd diff /run/current-system result

echo
read -r -p "Apply this update (switch)? [y/N] " reply
if [[ ! "$reply" =~ ^[Yy]$ ]]; then
  echo "==> Aborted. Restoring flake.lock..."
  git checkout -- flake.lock
  rm -f result
  exit 0
fi

echo "==> Switching..."
if [[ $EUID -eq 0 ]]; then
  nixos-rebuild switch --flake .#nixos
else
  sudo nixos-rebuild switch --flake .#nixos
fi

rm -f result

echo "==> Committing flake.lock..."
git add flake.lock
git commit -m "update flake.lock"

echo "==> Done."
