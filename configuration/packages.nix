{ config, lib, hostname, pkgs, stablepkgs, attrs, ...}:

{
  environment.systemPackages = with pkgs; (if hostname == "sodaROG" then [
    # system
    stablepkgs.asusctl

    # development
    python3
    
    # utilities
    android-tools
    nvtopPackages.full
    scrcpy
    supergfxctl-plasmoid

    # virtualisation
    wineWowPackages.stable

    # programs
    ardour
    aseprite
    blender
    easytag
    gimp
    hugo
    inkscape
    kdePackages.kwallet-pam
    krita
    libreoffice
    obs-studio
    pdfsam-basic
    processing
    puddletag
    redact
    sonic-pi
    supercollider
    tidal-hifi
    zotero
    (pkgs.callPackage ./soda/config/programs/grayjay.nix {})

    # games
    dwarf-fortress
    lutris
    prismlauncher
    steam
    
  ] else [
    # TODO XPS only
    # hyprland
    blueman
    brightnessctl
    kdePackages.dolphin
    dunst 
    grimblast
    hypridle
    hyprlock
    hyprpaper
    jq
    kdePackages.konsole
    nautilus
    networkmanagerapplet
    pavucontrol
    xfce.thunar
    tofi
    udiskie
    waybar
    wireplumber
    wl-clipboard
    xplr
    
  ]) ++ [ # TODO both systems
    # system
    comma
    openssh
    pciutils
    wget
    xorg.xrandr
    yubico-pam

    # development
    zsh
    zsh-powerlevel10k

    # utilities
    ani-cli
    bat 
    btop
    gallery-dl
    gparted
    fd
    file
    ffmpeg
    imagemagick
    jellyfin-media-player
    # kime # TODO until maintainer responds
    lsd
    lshw
    lsp-plugins
    man-pages
    mov-cli
    mpv
    mullvad
    mullvad-vpn
    nabi
    neofetch
    noisetorch
    piper
    powertop
    scli
    termimage
    toot
    uim
    qbittorrent
    qpwgraph
    yazi
    yt-dlp

    # programs
    anki
    audacity
    bitwarden
    brave
    freefilesync
    kdePackages.full
    kdePackages.konsole
    kitty
    kiwix
    localsend
    obsidian
    puredata
    signal-desktop
    sunvox
    uxn
    vscodium
    w3m
    zoom-us
  ];

  programs = {
    adb.enable = true;
    kdeconnect = {
      enable = true;
    };
    noisetorch.enable = true; 
    virt-manager.enable = true;
    zsh.enable = true;
  };
}
