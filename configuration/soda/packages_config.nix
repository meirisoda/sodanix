all@{ config, pkgs, username, stablepkgs, attrs, ...}:

{
  imports =
    [ 
      (pkgs.callPackage ./packages/comma.nix all)
      # ./packages/hyprland.nix
      # ./packages/plasma.nix
      # (pkgs.callPackage ./packages/rofi.nix allConfig)
      ./packages/vscode.nix
    ];
}