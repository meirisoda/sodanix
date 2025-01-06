{ config, pkgs, hostname, lib, ... }:

{
  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    # settings = {}; 
  };
  # services.blueman.enable = true;

  # Printing
  services.printing = {
    enable = true;
  };

  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Networking
  networking = {
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn 
      ];
    };
    hostName = hostname;
    # useDHCP = lib.mkDefault true;
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

  # Yubikey
  services.udev.packages = [ pkgs.yubikey-personalization ];

  security.pam.u2f.enable = true;

  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
    # kde.u2fAuth = true;
    xscreensaver.u2fAuth = true;
  };

  # security.polkit.enable = true;
}