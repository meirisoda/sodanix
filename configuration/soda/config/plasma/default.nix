{ config, inputs, lib, pkgs, ...}: 
{
  imports = [
    attrs.plasma-manager.homeManagerModules.plasma-manager
    # ./kwin.nix # Night light, titlebar, virtual desktops
    ./panels.nix # Panels
    ./theme.nix # Colorschemes, Cursors, Effects, Fonts, Icons, Sounds and Wallpapers.
  ];

  programs.plasma = {
    enable = true;
    overrideConfig = true;

    windows = {
      allowWindowsToRememberPositions = true;
    };
  };
}