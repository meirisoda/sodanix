{ config, pkgs, hostname, ...}:

{
  boot = {
    initrd = {
      kernelModules = if hostname == "sodaROG" then [ "amdgpu" "nvidia" ] else [ "kvm-intel" ];
      availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
    };
    kernelModules = [ ]; 
    kernelParams = if hostname == "sodaROG" then [ "nouveau.config=NvGspRm=1" ] else []; 
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_6_7; # manually update kernel // run uname -a to see current version
  };
}