{ config, pkgs, stablepkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = stablepkgs.linuxPackages_zen; # NEED TO MANUALLY UPDATE THE KERNEL DON'T FORGET ABOUT THIS PLEASE 
  # or remove to follow default kernel in 23.11 (because I am not in unstable)
  # stay up to date on this

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland"; # Wayland

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  #Services
  services.printing.enable = true;
  services.openssh.enable = true;

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
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    asusctl
    barrier
    bitwarden
    blender
    github-desktop
    google-chrome
    gparted
    figma-linux
    kitty
    libreoffice
    localsend
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

  # HOME MANAGER
  home-manager.users."soda" = {
    home = {
      stateVersion = "24.05";
    };
    programs = {
      git = {
        enable = true;
        userName = "meirisoda";
        userEmail = "appleblossom2001@gmail.com";
        lfs = {
          enable = true;
        };
      };
      zsh = {
        initExtraBeforeCompInit = ''
          # p10k instant prompt
          P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-''${(%):-%n}.zsh"
          [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
        '';
        enable = true;
        enableAutosuggestions = true;
        syntaxHighlighting.enable = true;
        autocd = true;
        oh-my-zsh = {
          enable = true;
        };
        plugins = [
          {
            file = "powerlevel10k.zsh-theme";
            name = "powerlevel10k";
            src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
          }
        ];
        shellAliases = {
          ga = "git add";
          gac = "git commit -am";
          gp = "git push";
          gpl = "git pull";
          rssound = "systemctl --user restart pipewire";
        };
      };
      kitty = {
        enable = true;
        settings = {
          background_opacity = "0.75";
          background_blur = 2;
        };
      };
      fzf = {
        enable = true;
        enableBashIntegration = true;
      };
    };
  };


  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11";

}
