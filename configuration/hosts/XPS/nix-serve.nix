{ config, pkgs, stablepkgs, attrs, ...}: 

{
  services.nix-serve = {
    enable = true;
    port = 4999;
    secretKeyFile = "/var/lib/nix-serve/cache-priv-key.pem";
  };
}