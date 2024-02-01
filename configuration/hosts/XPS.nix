{ config, pkgs, stablepkgs, ... }:

{
 imports = [
  ./XPS/nginx.nix
  ./XPS/nix-serve.nix
  ./XPS/cron.nix
 ]; 
}