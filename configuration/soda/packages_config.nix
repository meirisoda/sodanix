{ config, pkgs, stablepkgs, ...}:

{
  imports =
    [ 
      ./package/comma.nix
      # ./packages/hyprland.nix
      # ./packages/plasma.nix
      ./package/rofi.nix
      ./packages/vscode.nix
    ];
}