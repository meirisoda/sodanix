{ config, pkgs, stablepkgs, attrs, ...}: 

{
  services.nix-serve = {
    enable = true;
    port = 4999;
  };
}