#!/usr/bin/env bash
bash -c \"cd /etc/nixos; git stash; git stash clear; git pull; nixos-rebuild switch --flake \\\\".#sodaXPS\\\"\"
nix build --flake github:meirisoda/sodanix#sodaROG
