{ config, pkgs, stablepkgs, username, hostname, ... }:

{
  imports =
    [ 
      ./configuration/boot.nix
      ./configuration/system.nix
      ./configuration/hosts.nix
      ./configuration/home-manager.nix
      ./configuration/packages.nix
      ./soda.nix
    ];

  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    inputMethod = {
      enabled = "kime";
      kime = {
        daemonModules = [
          "Wayland"
          "Indicator"
        ];
        iconColor = "White";
      };
    };
  }; 

  nix = {
    settings.allowed-users = [
      "@wheel"
      "soda"
    ];
    extraOptions = ''experimental-features = nix-command flakes'';
    gc = {
      automatic = true; 
      dates = "weekly";
    };
  };

  programs = { # TODO where to put.
    zsh.enable = true;
    noisetorch.enable = true; 
  };
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "23.11"; 

}
