{ config, pkgs, stablepkgs, ... }:

{
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  programs.xwayland.enable = true;
}