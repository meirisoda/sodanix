{ config, pkgs, stablepkgs, username, ... }:

let
    inherit (config.lib.formats.rasi) mkLiteral;
    rofi-theme = {
      "*" = {
        background-color = mkLiteral "#ebebeb";
      };
    };
  in {
    home-manager.users.${username} = {
      programs.rofi = {
        enable = true;
        theme = rofi-theme;
      };
  }
};

