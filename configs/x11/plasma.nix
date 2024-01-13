{ config, pkgs, stablepkgs, sodasddm, ... }:

{
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.sddm.theme = "${sodasddm}";
  programs.xwayland.enable = true;
}