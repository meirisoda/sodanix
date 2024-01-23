{ config, lib, hostname, pkgs, stablepkgs, ...}:

{
  environment.systemPackages = with pkgs; (if hostname == "sodaROG" then [ # only rog!! 
    # === system === #
    curl
    openssh
    wget
    xorg.xrandr
    yubico-pam

    # === development === #
    cmake
    cudatoolkit
    
    # === utilities === #
    asusctl
    supergfxctl
    # "${watershot}"

    # === virtualization === #
    virt-manager
    qemu

    # === programs === #
    blender
    calibre
    cbonsai
    gimp
    github-desktop
    krita
    puredata
    sonic-pi
    (pkgs.callPackage ../programs/sunvox.nix {})

    # === games === # 
    lutris
    ppsspp-sdl-wayland
    prismlauncher
    steam
    yuzu-mainline
  ] else [
    
  ]) ++ [ # both systems
    # === system  === #
    curl
    openssh
    wget
    xorg.xrandr
    yubico-pam

    # === development === #
    zsh
    zsh-powerlevel10k
    
    # === utilities === #
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

    # === programs === #
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