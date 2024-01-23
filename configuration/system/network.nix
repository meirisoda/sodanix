{ config, pkgs, hostname, ... }:

{
  networking.networkmanager = {
    enable = true;
    hostName = hostname;
  };

  services = {
    openssh = {
      enable = true;
    };
    syncthing = {
      enable = true; 
      user = "soda";
      dataDir = "home/soda/Documents/syncthing";
      configDir = "/home/soda/.config/syncthing";
      settings.gui = {
        user = "soda";
        password = "banana";
      }; 
    };
  };
}