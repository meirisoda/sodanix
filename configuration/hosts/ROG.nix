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
    # power 
    power-profiles-daemon.enable = true;
    # tlp = {
      # enable = true;
      # settings = {
        # USB_AUTOSUSPEND=0;
        # CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        # CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
# 
        # STOP_CHARGE_THRESH_BAT0 = 95;
      # };
    # };
  };

  hardware.amdgpu = {
    loadInInitrd = true;
    amdvlk = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    powerManagement = {
      enable = false;
      finegrained = false; 
    };
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

  boot.kernelParams = [
    "amdgpu.gpu_recovery=1"
    "amdgpu.sg_display=0"
    "amdgpu.dcdebugmask=0x10"
  ];

#   powerManagement = {
#     enable = true;
  # };
}