allConfig@{ config, pkgs, username, stablepkgs, attrs, ...}:

{
  imports =
    [ 
      (pkgs.callPackage ./packages/comma.nix allConfig)
      # ./packages/hyprland.nix
      # ./packages/plasma.nix
      # (pkgs.callPackage ./packages/rofi.nix allConfig)
      # ./packages/vscode.nix
    ];
}