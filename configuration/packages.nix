{ config, lib, hostname, pkgs, stablepkgs, ...}:

{
  environment.systemPackages = with pkgs; (if hostname == "sodaROG" then [ # only rog!! 
    # system
    rofi-wayland

    # development
    cudatoolkit
    
    # utilities
    asusctl
    nvtop-nvidia
    supergfxctl
    # "${watershot}"

    # virtualisation
    virt-manager
    qemu

    # programs
    ani-cli
    audacity
    blender
    calibre
    cbonsai
    figma-linux
    gimp
    github-desktop
    inkscape
    komikku
    krita
    libreoffice
    obs-studio
    obsidian
    pdfsam-basic
    puredata
    sonic-pi
    (pkgs.callPackage ./packages/programs/sunvox.nix {})
    zoom-us

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
    btop
    gparted
    ffmpeg
    flameshot
    kime
    lshw
    mpv
    mullvad
    mullvad-vpn
    neofetch
    noisetorch
    pfetch
    piper
    syncthing
    qbittorrent
    qpwgraph
    wineWowPackages.stable

    # program
    bitwarden
    calibre
    discord
    google-chrome
    kitty
    localsend
    spotify
    tidal-hifi
    vscodium
  ];

  programs = {
    zsh.enable = true;
    noisetorch.enable = true; 
    virt-manager.enable = true;
    kdeconnect = {
      enable = true;
    };
  };
}