{ config, ...}:

{
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = stablepkgs.linuxPackages_6_7; # manually update kernel // run uname -a to see current version
}