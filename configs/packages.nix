{ config, pkgs, stablepkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # system 
    openssh
    wget
    xorg.xrandr
    yubico-pam
    zsh
    zsh-powerlevel10k
    # utilities
    asusctl
    barrier
    cudatoolkit
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
    spotify
    tidal-hifi
    vscodium
    zoom-us
  ];

}