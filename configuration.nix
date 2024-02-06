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
      # enabled = "fcitx5";
      # fcitx5 = { 
      #   settings.addons = [
      #     fcitx-mozc
      #     fcitx-hangul
      #   ];
      # };
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
        "https://tln32asus.student.cwru.edu:5000/"
        "https://sodaxps.student.cwru.edu:5000/"
      ];
      trusted-public-keys = [
        "tln32asus.student.cwru.edu:V8MCTN/ox+Y5GxqFsjAml4IfcUvTacLFIqw48A9Ic/o="
      ];
      "max-jobs" = 8;
      "builders" = ''ssh://soda@sodaxps.student.cwru.edu?ssh-key=/home/soda/.ssh/id_ed25519 i686_linux,x86_64-linux - 8 5 kvm - AAAAC3NzaC1lZDI1NTE5AAAAIGUQvWrDYFHZIrUGgEZ6yeY3yEKdphCtaB6RrdxDezEe'';
    };
    distributedBuilds = true;
    gc = {
      automatic = true; 
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  virtualisation.libvirtd.enable = true;
  
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "23.11"; #nixos-rebuild list-generations to see what version I'm on

}
