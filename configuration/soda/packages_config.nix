allConfig@{ config, pkgs, username, stablepkgs, attrs, ...}:

{
  imports =
    [ 
      (import ./config/comma.nix (allConfig // {inherit username;}))
      (import ./config/hyprland.nix (allConfig // {inherit username;}))
      # ./config/plasma.nix
      # (pkgs.callPackage ./config/rofi.nix allConfig)
      ./config/vscode.nix
    ];
}