{ config, pkgs, stablepkgs, kernelpkgs, hostname, ...}:

{
  boot = {
    initrd = {
      kernelModules = if hostname == "sodaROG" then [ "amdgpu" ] else [ "kvm-intel" ]; 
      availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"]; 
    };
    kernelModules = [ ]; 
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    # kernelPackages = pkgs.linuxPackages_latest; # manually update kernel // run uname -a to see current version
    kernelPackages = kernelpkgs.linuxPackages_6_10; #temporarily testing older kernel version to fix ppd/active gpu bleh
  };
}