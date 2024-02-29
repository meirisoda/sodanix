{ config, pkgs, stablepkgs, username, ... }:

{
  # imports = [
  #   plasma-manager.homeManagerModules.plasma-manager
  # ];

  home-manager.users.${username} = {
    programs.plasma = {
      workspace = {
        clickItemTo = "select";
        theme = "breeze-twilight";
        colorScheme = "BreezeLight";
        wallpaper = ./plasma/blue.png;
      };
      spectacle.shortcuts = {
        captureRectangularRegion = "Meta+Shift+S";
      };
      shortcuts = {
        # Applications
        "discord.desktop"."_launch" = "Alt+D";
        "codium.desktop"."_launch" = "Alt+V";v
        "firefox.desktop"."_launch" = "Alt+F";
        "kitty.desktop"."_launch" = "Ctrl+Alt+T";
        "tidal-hifi.desktop"."_launch" = "Alt+T";
        "rog-control-center.desktop"."_launch" = "Alt+R";
        "obsidian.desktop"."_launch" = "Alt+O";

        # KWin
        "kwin"."ShowDesktopGrid" = "Meta+F8";
        "kwin"."Switch One Desktop Down" = ["Meta+Ctrl+Down" "Meta+Ctrl+@"];
        "kwin"."Switch One Desktop Up" = ["Meta+Ctrl+!" "Meta+Ctrl+Up"];
        "kwin"."Switch One Desktop to the Left" = ["Meta+Ctrl+2" "Meta+Ctrl+Left"];
        "kwin"."Switch One Desktop to the Right" = ["Meta+Ctrl+1" "Meta+Ctrl+Right"];

        "kwin"."Walk Through Windows" = "Alt+Tab";
        "kwin"."Walk Through Windows (Reverse)" = "Alt+Shift+Backtab"; 
        "kwin"."Window Above Other Windows" = "Ctrl+Alt+Up";
        "kwin"."Window Close" = ["Alt+F4" "Alt+W"];
        "kwin"."Window Maximize" = ["Meta+PgUp" "Meta+Ctrl+P" "Ctrl+Alt+P"];
        "kwin"."Window Minimize" = ["Meta+PgDown" "Meta+Ctrl+O" "Ctrl+Alt+O"];

        "kwin"."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "kwin"."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";  
        "kwin"."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left"; 
        "kwin"."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right"; 
      };
    };
  };
}