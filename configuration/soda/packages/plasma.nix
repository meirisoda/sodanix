{ config, pkgs, stablepkgs, username, ... }:

{
  home-manager.users.${username} = {
    programs.plasma = {
      workspace = {
        clickItemTo = "select";
        theme = "breeze-twilight";
        colorScheme = "BreezeLight";
        wallpaper = ./plasma/blue.png;
      };
      shortcuts = {

      };
      spectacle.shortcuts = {
        captureRectangularRegion = "Meta+Shift+S";
      };
    };
  };
}