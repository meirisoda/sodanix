{ config, pkgs, hostname, ...}:

{
  boot = {
    initrd.kernelModules = [ "nvidia" ];
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
    # blacklistedKernelModules = [ "nouveau" ];
    kernelModules = if hostname == "sodaROG" then [ "kvm-amd" ] else []; 
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_6_7; # manually update kernel // run uname -a to see current version
  };
}