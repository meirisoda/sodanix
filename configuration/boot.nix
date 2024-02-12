{ config, pkgs, hostname, ...}:

{
  boot = {
    initrd.kernelModules = [ ];
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
    blacklistedKernelModules = [ "nouveau" ];
    kernelModules = if hostname == "sodaROG" then [ "kvm-amd" ] else []; 
    extraModulePackages = [ ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest; # manually update kernel // run uname -a to see current version
  };
}