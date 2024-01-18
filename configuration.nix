{ config, pkgs, stablepkgs, ... }:

{
  imports =
    [ 
      ./configuration/hardware/hardware-configuration.nix
      ./configuration/hardware/yubikey.nix
      ./configuration/hardware/bluetooth.nix
      ./configuration/network/ssh.nix
      ./configuration/home-manager.nix
      ./configuration/packages.nix
      ./configuration/x11.nix
      ./configuration/virtualisation.nix
    ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = stablepkgs.linuxPackages_6_7; # manually update kernel // run uname -a to see current version
    initrd.kernelModules = [ "nvidia" ];
    extraModulePackages = [ config.boot.kernelPackages.nvidiaPackages.stable ];
  };

  networking.hostName = "sodanix"; # Define your hostname

  # Enable networking
  networking.networkmanager.enable = true;

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
  

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
  };
  

  users.users.soda = {
    isNormalUser = true;
    description = "soda";
    extraGroups = [ "networkmanager" "wheel" "libvirtd"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      vscodium
    ];
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
  

  system.stateVersion = "23.11"; # defines the version of NixOS I am on

}
