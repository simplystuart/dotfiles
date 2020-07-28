#!/usr/bin/env bash

echo "Installnig nix..."
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
