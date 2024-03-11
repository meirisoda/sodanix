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
    power-profiles-daemon.enable = false; # plasma
    tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 15;
        STOP_CHARGE_THRESH_BAT0 = 95;

        CPU_ENERGY_PERF_POLICY_ON_AC = balance_performance;
        CPU_ENERGY_PERF_POLICY_ON_BAT = balance_power;

        PLATFORM_PROFILE_ON_AC = balanced;
        PLATFORM_PROFILE_ON_BAT = low-power;

        RADEON_DPM_PERF_LEVEL_ON_AC = auto; # dynamic power management
        RADEON_DPM_PERF_LEVEL_ON_BAT = auto;

        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;

        RUNTIME_PM_ON_BAT = auto; # lower fan noise 
        
        USB_AUTOSUSPEND = 0; # disable
        USB_EXCLUDE_AUDIO = 1; # exclude audio from suspending
        USB_EXCLUDE_BTUSB = 1; # exclude bluetooth from suspending
      };
    };
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
      offload = {
        # enable = lib.mkForce true; 
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

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  powerManagement = {
    enable = true;
  };

}