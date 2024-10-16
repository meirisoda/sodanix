{ config, lib, hostname, pkgs, stablepkgs, attrs, ...}:

{
  environment.systemPackages = with pkgs; (if hostname == "sodaROG" then [
    # system
    stablepkgs.asusctl
    tlp

    # development
    python3
    
    # utilities
    android-tools
    gallery-dl
    nvtopPackages.full
    powertop
    scrcpy

    # virtualisation
    wineWowPackages.stable

    # programs
    ani-cli
    ardour
    aseprite
    audacity
    # blender
    discord
    drawio
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
    sonic-pi
    sunvox
    supercollider
    ytmdesktop
    zoom-us
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

    # hyprland
    # blueman
    brightnessctl
    kdePackages.dolphin
    kdePackages.full
    # dunst 
    grimblast
    # hypridle
    # hyprlock
    # hyprpaper
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
    yazi

    # development
    zsh
    zsh-powerlevel10k

    # utilities
    bat 
    btop
    gparted
    fd # lists files in directory
    file
    ffmpeg
    # graphviz
    jellyfin-media-player
    kime #korean keyboard
    lsd
    lshw
    lsp-plugins
    man-pages
    mpv
    mullvad
    mullvad-vpn
    neofetch
    noisetorch
    piper
    qbittorrent
    qpwgraph
    yt-dlp

    # programs
    bitwarden
    bottles
    calibre
    kitty
    localsend
    obsidian
    signal-desktop
    # spotify
    tidal-hifi
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
}