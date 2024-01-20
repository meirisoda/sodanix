{ config, pkgs, stablepkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # system 
    curl
    openssh
    wget
    xorg.xrandr
    yubico-pam

    # developlment
    cmake
    cudatoolkit
    zsh
    zsh-powerlevel10k
    
    # utilities
    asusctl
    barrier
    dunst
    gparted
    grim
    ffmpeg
    flameshot
    kime
    lshw
    mpv
    neofetch
    noisetorch
    pfetch
    piper
    supergfxctl
    virt-manager
    qbittorrent
    qemu
    qpwgraph
    "${watershot}"
    wineWowPackages.stable

    # programs
    audacity
    bitwarden
    blender
    btop
    calibre
    discord
    gimp
    github-desktop
    google-chrome
    figma-linux
    kitty
    krita
    libreoffice
    localsend
    lutris
    obs-studio
    obsidian
    pdfsam-basic
    prismlauncher
    puredata
    # sonic-pi
    steam
    (pkgs.callPackage ../programs/sunvox.nix {})
    spotify
    tidal-hifi
    vscodium
    zoom-us
  ];

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    cudaSupport = true;
  };

  programs = {
    zsh.enable = true;
    noisetorch.enable = true; 
  };
  users.defaultUserShell = pkgs.zsh;
}