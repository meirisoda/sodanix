allConfig@{ config, pkgs, username, stablepkgs, attrs, ...}:

{
  imports =
    [ 
      (import ./config/programs/comma.nix (allConfig // {inherit username;}))
      (import ./config/hyprland/hyprland.nix (allConfig // {inherit username;}))
      # (import ./config/programs/plasma.nix (allConfig // {inherit username;}))
      # (pkgs.callPackage ./config/rofi.nix allConfig)
      ./config/vscode.nix
    ];
}