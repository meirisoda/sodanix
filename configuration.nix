{ config, pkgs, stablepkgs, hostname, lib, ... }:

{
  imports =
    [ 
      ./configuration/boot.nix
      ./configuration/x11.nix
      ./configuration/hardware.nix
      ./configuration/hosts.nix
      ./configuration/packages.nix
      ./configuration/soda.nix
      # ./configuration/guest.nix
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
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [ fcitx5-hangul fcitx5-anthy ];
        waylandFrontend = true;
      };
    };
  };  


  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes 
      builders-use-substitutes = true
    '';
    settings = {
      allowed-users = [
        "@wheel"
        "soda"
      ];
      trusted-substituters = [
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      trusted-users = [ "soda" ];
      "max-jobs" = 8;
    };
    distributedBuilds = true;
    gc = {
      automatic = true; 
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  virtualisation = {
    libvirtd.enable = true;
  };
  

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  system.stateVersion = "23.11"; #nixos-rebuild list-generations to see what version I'm on

}
