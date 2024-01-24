{ config, pkgs, stablepkgs, hostname, lib, ... }:

{
  imports =
    [ 
      ./configuration/boot.nix
      ./configuration/x11.nix
      ./configuration/hardware-config.nix
      ./configuration/hosts.nix
      ./configuration/packages.nix
      ./configuration/soda.nix
    ];

  time.timeZone = "America/New_York";

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
  
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  system.stateVersion = "23.11"; 

}
