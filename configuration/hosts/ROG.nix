{ config, pkgs, stablepkgs, lib, ...}:

{  
  services = {
    xserver = {
      videoDrivers = [
        "amdgpu"
        "nvidia"
      ];
    };
    asusd = {
      enable = true; 
      enableUserService = true; 
    };
  };

  hardware.amdgpu = {
    loadInInitrd = true;
    amdvlk = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    prime = {
      reverseSync.enable = true; 
      # sync = {
      #  enable = true;
      # };
      offload = {
        # enable =  true;
        enableOffloadCmd = true;
      };
      nvidiaBusId = lib.mkForce "PCI:1:0:0";
      amdgpuBusId = lib.mkForce "PCI:65:0:0";
    };
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  powerManagement = {
    enable = true;
    # powertop.enable = true;
  };
}