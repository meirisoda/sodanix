{ config, pkgs, stablepkgs, ... }:

{
  services.openssh = {
    enable = true;
  };
}