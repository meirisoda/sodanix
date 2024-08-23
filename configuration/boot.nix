{ config, pkgs, hostname, ...}:

{
  boot = {
    initrd = {
      kernelModules = if hostname == "sodaROG" then [ "amdgpu" "nvidia" ] else [ "kvm-intel" ]; # 👈 ENABLE NVIDIA
      availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"]; 
    };
    kernelModules = [ ]; 
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest; # manually update kernel // run uname -a to see current version
  };
}