{ config, lib, hostname, pkgs, stablepkgs, ...}:

{
  environment.systemPackages = with pkgs; (if hostname == "sodaROG" then [ # only rog!! 
    # system

    # development
    cudatoolkit
    
    # utilities
    asusctl
    supergfxctl
    # "${watershot}"

    # virtualisation
    virt-manager
    qemu

    # programs
    blender
    calibre
    cbonsai
    gimp
    github-desktop
    komikku
    krita
    puredata
    sonic-pi
    (pkgs.callPackage ./packages/programs/sunvox.nix {})

    # games
    lutris
    ppsspp-sdl-wayland
    prismlauncher
    steam
    yuzu-mainline
    
  ] else [
    
  ]) ++ [ # TODO both systems
    # system
    curl
    openssh
    wget
    xorg.xrandr
    yubico-pam

    # development
    cmake
    zsh
    zsh-powerlevel10k
    
    # utilities
    barrier
    gparted
    ffmpeg
    flameshot
    kime
    lshw
    mpv
    neofetch
    noisetorch
    pfetch
    piper
    syncthing
    qbittorrent
    qpwgraph
    wineWowPackages.stable

    # program
    audacity
    bitwarden
    btop
    calibre
    discord
    google-chrome
    figma-linux
    kitty
    libreoffice
    localsend
    obs-studio
    obsidian
    pdfsam-basic
    spotify
    tidal-hifi
    vscodium
    zoom-us
  ];
}