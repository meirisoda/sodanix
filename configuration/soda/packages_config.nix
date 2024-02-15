{ config, pkgs, username, stablepkgs, ...}:

{
  imports =
    [ 
      ./packages/comma.nix
      # ./packages/hyprland.nix
      # ./packages/plasma.nix
      # ./packages/rofi.nix
      ./packages/vscode.nix
    ];
}