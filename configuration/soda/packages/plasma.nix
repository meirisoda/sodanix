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
        "kwin"."Switch One Desktop Down" = ["Meta+Ctrl+Down" "Meta+Ctrl+@"];
        "kwin"."Switch One Desktop Up" = ["Meta+Ctrl+!" "Meta+Ctrl+Up"];
        "kwin"."Switch One Desktop to the Left" = ["Meta+Ctrl+2" "Meta+Ctrl+Left"];
        "kwin"."Switch One Desktop to the Right" = ["Meta+Ctrl+1" "Meta+Ctrl+Right"];
        "kwin"."Walk Through Windows" = "Alt+Tab";
        "kwin"."Window Above Other Windows" = "Ctrl+Alt+Up";
        "kwin"."Window Maximize" = ["Meta+PgUp" "Meta+Ctrl+P" "Ctrl+Alt+P"];
        "kwin"."Window Minimize" = ["Meta+PgDown" "Meta+Ctrl+O" "Ctrl+Alt+O"];
        "kwin"."Window On All Desktops" = "Ctrl+Alt+Shift+Up";
        "kwin"."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "kwin"."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        "kwin"."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
        "kwin"."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
        "kwin"."Window to Next Screen" = "Meta+Shift+Right";
        "kwin"."Window to Previous Screen" = "Meta+Shift+Left";

        "org_kde_powerdevil"."powerProfile" = ["Battery" "Meta+B"];

        "services.codium.desktop"."_launch" = "Alt+V";
        "services.discord.desktop"."_launch" = "Alt+D";
        "services.element-desktop.desktop"."_launch" = "Alt+M";
        "services.firefox.desktop"."_launch" = "Alt+F";
        "services.kitty.desktop"."_launch" = "Ctrl+Alt+T";
        "services.obsidian.desktop"."_launch" = "Alt+O";
        "services.org.kde.dolphin.desktop"."_launch" = ["Alt+E" "Meta+E"];
        "services.org.kde.spectacle.desktop"."RectangularRegionScreenShot" = "Meta+Shift+S";
        "services.org.kde.spectacle.desktop"."_launch" = "Print";
        "services.rog-control-center.desktop"."_launch" = "Alt+R";
        "services.tidal-hifi.desktop"."_launch" = "Alt+T";
      };
    };
  };
}