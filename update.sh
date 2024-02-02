#!/usr/bin/env bash
sudo nixos-rebuild switch --flake github:meirisoda/sodanix#sodaXPS
sudo nixos-rebuild build --flake github:meirisoda/sodanix#sodaROG
