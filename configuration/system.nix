{ ... }:

{
  imports = [
    ./configuration/system/bluetooth.nix
    ./configuration/system/network.nix
    ./configuration/system/printing.nix
    ./configuration/system/sound.nix
    ./configuration/system/yubikey.nix
  ];
}