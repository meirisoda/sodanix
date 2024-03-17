{ config, pkgs, stablepkgs, ...}: 

{
  services.duplicity = {
    enable = true;
    frequency = "daily";
  };
}