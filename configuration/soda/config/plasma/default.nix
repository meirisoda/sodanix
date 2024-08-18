{ config, inputs, lib, pkgs, username, ...}: 
{
  imports = [
    # attrs.plasma-manager.homeManagerModules.plasma-manager

    # ./kwin.nix # Night light, titlebar, virtual desktops
    ./panels.nix # Panels
    (import ./theme.nix (allConfig // {inherit username;})) # Colorschemes, Cursors, Effects, Fonts, Icons, Sounds and Wallpapers.
  ];
  home-manager.users.${username} = {
    programs.plasma = {
      enable = true;
      overrideConfig = true;

      windows = {
        allowWindowsToRememberPositions = true;
      };
    };
  };
}