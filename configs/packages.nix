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
    gparted
    flameshot
    lshw
    neofetch
    pfetch
    piper
    supergfxctl
    # programs
    bitwarden
    blender
    btop
    discord
    github-desktop
    google-chrome
    figma-linux
    kitty
    libreoffice
    localsend
    lutris
    obs-studio
    obsidian
    pdfsam-basic
    prismlauncher
    puredata
    steam
    (pkgs.callPackage ../programs/sunvox.nix {})
    spotify
    tidal-hifi
    vscodium
    zoom-us
  ];

}