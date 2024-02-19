{ config, lib, hostname, pkgs, stablepkgs, ...}:

{
  environment.systemPackages = with pkgs; (if hostname == "sodaROG" then [
    # system

    # development
    cudatoolkit
    
    # utilities
    android-tools
    nvtop
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
    comma
    curl
    openssh
    pciutils
    wget
    xorg.xrandr
    yubico-pam

    # development
    cmake
    zsh
    zsh-powerlevel10k
    
    # utilities
    barrier
    bat
    btop
    gparted
    fd
    ffmpeg
    flameshot
    kime
    lsd
    lshw
    mpv
    mullvad
    mullvad-vpn
    neofetch
    noisetorch
    pfetch
    piper
    rofi
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
    obsidian
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
    adb = {
      enable = true; 
    };
  };
}