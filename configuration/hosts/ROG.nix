{ config, pkgs, stablepkgs, lib, ...}:

{  
  imports = [
    # ./ROG/duplicity.nix
    # ./ROG/cron.nix
  ];

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
    power-profiles-daemon.enable = true;
    thermald.enable = true;
    # tlp = {
    #   enable = true;
    #   settings = {
    #     START_CHARGE_THRESH_BAT0 = 40;
    #     STOP_CHARGE_THRESH_BAT0 = 95; 

    #     CPU_SCALING_GOVERNOR_ON_AC = "balanced";
    #     CPU_ENERGY_PERF_POLICY_ON_AC = "balanced";

    #     CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    #     CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        
    #     CPU_MIN_PERF_ON_AC = 0;
    #     CPU_MAX_PERF_ON_AC = 100;
    #     CPU_MIN_PERF_ON_BAT = 0;
    #     CPU_MAX_PERF_ON_BAT = 40;

    #     DISK_DEVICES = "nvme0n1 sda";
    #     DISK_IDLE_SECS_ON_AC = 0;
    #     DISK_IDLE_SECS_ON_BAT = 2;

    #     USB_AUTOSUSPEND = 0;
    #     USB_EXCLUDE_AUDIO = 1; 
    #   };
    # };
    # Battery
    supergfxd = {
      enable = true;
      settings = {
        supergfxctl-mode = "Integrated";
        gfx-vfio-enable = true;
      };  # Power Profiles
    };
  };

  # powerManagement = {
  #   # powertop.enable = true;
  #   enable = true;
  # };

  programs = {
    auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          scaling_max_freq = 3300000; 
          turbo = "never";
        };
        battery = {
          governor = "powersave";
          scaling_min_freq = 400000;
          scaling_max_freq = 2000000;
          turbo = "never";
          enable_thresholds = true;
          stop_threshold = 95;
        };
      };
    };
  };

  # systemd.services = {
  #   # supergfxd.path = [ pkgs.pciutils ];
  #   power-profiles-daemon = {
  #     enable = true;
  #     wantedBy = [ "multi-user.target" ];
  #   };
  # };

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
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  boot.kernelParams = [
    "amdgpu.gpu_recovery=1"
    "amdgpu.sg_display=0"
    "amdgpu.dcdebugmask=0x10"
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

}