allConfig@{ config, pkgs, username, stablepkgs, attrs, ...}:

{
  imports =
    [ 
      (import ./packages/comma.nix (allConfig // {inherit username;}))
      # ./packages/hyprland.nix
      # ./packages/plasma.nix
      # (pkgs.callPackage ./packages/rofi.nix allConfig)
      ./packages/vscode.nix
    ];
}