{ config, lib, hostname, pkgs, stablepkgs, ...}:

{
  environment.systemPackages = with pkgs; (if hostname == "sodaROG" then [
    # system

    # development
    # cudatoolkit
    # github-desktop
    
    # utilities
    android-tools
    nvtopPackages.full
    # powertop

    # virtualisation
    wineWowPackages.stable

    # programs
    ani-cli
    audacity
    # blender
    # gimp
    inkscape
    # krita
    # libreoffice
    obs-studio
    pdfsam-basic
    puredata
    scrcpy
    (pkgs.callPackage ./soda/config/programs/sunvox.nix {})
    zoom-us

    # games
    lutris
    prismlauncher
    steam
    
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

    # hyprland
    dunst
    hyprpaper
    jq
    networkmanagerapplet
    rofi
    tofi
    waybar
    xplr

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
    # ffmpeg
    graphviz
    jellyfin-media-player
    kime
    lsd
    lshw
    man-pages
    mpv
    mullvad
    mullvad-vpn
    neofetch
    noisetorch
    piper
    syncthing
    qbittorrent
    qpwgraph

    # programs
    bitwarden
    calibre
    discord
    element-desktop
    kitty
    localsend
    obsidian
    signal-desktop
    spotify
    tidal-hifi
    trilium-desktop
    vscodium
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

  services.tailscale.enable = true;
}