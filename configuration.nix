{ config, pkgs, stablepkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./home-manager.nix
      ./configs/x11.nix
      ./configs/yubikey.nix
      ./configs/ssh.nix
    ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = stablepkgs.linuxPackages_zen; # NEED TO MANUALLY UPDATE THE KERNEL DON'T FORGET ABOUT THIS PLEASE 
      # or remove to follow default kernel in 23.11 (because I am not in unstable)
      # stay up to date on this
    initrd.kernelModules = [ "nvidia" ];
    extraModulePackages = [ cconfig.boot.kernelPackages.nvidiaPackages.stable ];
  };

  networking.hostName = "sodanix"; # Define your hostname

  # Enable networking
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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


  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  

  users.users.soda = {
    isNormalUser = true;
    description = "soda";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      kate
    ];
  };

  nix = {
    settings.allowed-users = [
      "@wheel"
      "soda"
    ];
    extraOptions = ''experimental-features = nix-command flakes'';
  };

    # Allow unfree packages
    nixpkgs.config = {
      allowUnfree = true;
      cudaSupport = true;
    };
    

  environment.systemPackages = with pkgs; [
    asusctl
    barrier
    bitwarden
    blender
    cudatoolkit
    discord
    github-desktop
    google-chrome
    gparted
    figma-linux
    kitty
    libreoffice
    localsend
    lshw
    lutris
    neofetch
    openssh
    obs-studio
    obsidian
    piper
    prismlauncher
    puredata
    steam
    supergfxctl
    spotify
    tidal-hifi
    vscodium
    wget
    xorg.xrandr
    yubico-pam
    zoom-us
    zsh
    zsh-powerlevel10k
  ];

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "23.11"; # defines the version of NixOS I am on

}
