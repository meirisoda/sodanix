{ config, lib, hostname, pkgs, stablepkgs, attrs, ...}:

{
  environment.systemPackages = with pkgs; (if hostname == "sodaROG" then [
    # system
    stablepkgs.asusctl

    # development
    python3
    
    # utilities
    android-tools
    gallery-dl
    nvtopPackages.full
    powertop
    scrcpy
    supergfxctl-plasmoid

    # virtualisation
    wineWowPackages.stable

    # programs
    ani-cli
    ardour
    aseprite
    audacity
    blender
    discord
    # drawio
    easytag
    gimp
    inkscape
    kdePackages.kwallet-pam
    krita
    libreoffice
    obs-studio
    pdfsam-basic
    puddletag
    puredata
    processing
    reaper
    redact
    sonic-pi
    soulseekqt
    sunvox
    supercollider
    ytmdesktop
    zotero

    # games
    lutris
    prismlauncher
    steam
    
  ] else [
    
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
    bat 
    btop
    easyeffects
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
    mpv
    mullvad
    mullvad-vpn
    nabi
    neofetch
    noisetorch
    piper
    qbittorrent
    qpwgraph
    yt-dlp

    # programs
    anki
    bitwarden
    bottles
    # brave
    hugo
    kdePackages.full
    kdePackages.konsole
    kitty
    kiwix
    localsend
    obsidian
    signal-desktop
    tidal-hifi
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

    # # hyprland
    # blueman
    # brightnessctl
    # kdePackages.dolphin
    # dunst 
    # grimblast
    # hypridle
    # hyprlock
    # hyprpaper
    # jq
    # kdePackages.konsole
    # nautilus
    # networkmanagerapplet
    # pavucontrol
    # xfce.thunar
    # tofi
    # udiskie
    # waybar
    # wireplumber
    # wl-clipboard
    # xplr
    # yazi