{ config, pkgs, stablepkgs, kernelpkgs, hostname, attrs, ...}:

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
    # kernelPackages = kernelpkgs.linuxPackages_6_10; #manually switching to 6.10 to fix ppd issue with 6.11 (reported to kernel maintainers)
    
    kernelPackages = 
      let
        linux_hardened_pkg = { fetchurl, buildLinux, ... } @ args:

          buildLinux (args // rec {
            version = "6.9-test";
            modDirVersion = "6.12.0";

            src = "${attrs.linux-kernel}";
            ignoreConfigErrors = true;

            extraMeta.branch = "6.9";
          } // (args.argsOverride or {}));
        linux_hardened = pkgs.callPackage linux_hardened_pkg{};
      in
        pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_hardened);
  };
}