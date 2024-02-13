{ config, pkgs, stablepkgs, ...}:

{
  imports =
    [ 
      ./packages/vscode.nix
      # ./packages/hyprland.nix
      # ./packages/plasma.nix
    ];
}