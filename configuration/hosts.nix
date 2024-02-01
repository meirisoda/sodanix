{ config, pkgs, hostname, ...}:

{
  imports = 
    if hostname == "sodaROG" then [
      ./hosts/ROG.nix
    ] else [
      ./hosts/XPS.nix
    ];
}