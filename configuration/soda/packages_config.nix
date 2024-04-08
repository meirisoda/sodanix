allConfig@{ config, pkgs, username, stablepkgs, attrs, ...}:

{
  imports =
    [ 
      (import ./config/comma.nix (allConfig // {inherit username;}))
      ./config/hyprland.nix
      # ./config/plasma.nix
      # (pkgs.callPackage ./config/rofi.nix allConfig)
      ./config/vscode.nix
    ];
}