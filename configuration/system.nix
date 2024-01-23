{ lib, config, pkgs, ... }:

{
  imports = [
    ./system/bluetooth.nix
    ./system/network.nix
    ./system/printing.nix
    ./system/sound.nix
    # ./system/yubikey.nix
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/ROOT";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-label/HOME";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/SWAP"; }
    ];

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}