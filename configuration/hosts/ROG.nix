{ config, pkgs, stablepkgs, ...}:

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
    amdvlk = true;
    opencl = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = false; 
      finegrained = true;
    };
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
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:65:0:0";
    };
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  powerManagement = {
    enable = true;
    # powertop.enable = true;
  };
}