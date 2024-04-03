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
    # Battery
    power-profiles-daemon.enable = true;
    thermald.enable = true;
    supergfxd = {
      enable = true;
      settings = {
        supergfxctl-mode = "Integrated";
        gfx-vfio-enable = true;
      };  # Power Profiles
    };
  };

  systemd.services = {
    supergfxd.path = [ pkgs.pciutils ];
    power-profiles-daemon = {
      enable = true;
      wantedBy = [ "multi-user.target" ];
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

  # powerManagement = {
  #   # powertop.enable = true;
  #   enable = true;
  # };

  programs.auto-cpufreq = {
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

}