{ lib, config, pkgs, ... }:

{
  imports = [
    ./hardware/default.nix
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/ROOT";
      fsType = "ext4";
      neededForBoot = true;
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      neededForBoot = true;
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-label/HOME";
      fsType = "ext4";
      neededForBoot = true;
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/SWAP"; }
    ];

  hardware.enableRedistributableFirmware = true;
  
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}