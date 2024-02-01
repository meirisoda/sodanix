#!/usr/bin/env bash
nixos-rebuild switch --flake github:meirisoda/sodanix#sodaXPS
nixos-rebuild build --flake github:meirisoda/sodanix#sodaROG
