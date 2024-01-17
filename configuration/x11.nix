{ config, pkgs, stablepkgs, ... }:

{
  imports =
    [
      ./x11/plasma.nix
    ];
  services = {
    ratbagd.enable = true; #mouse
    xserver = {
      enable = true;
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
        };
      };
      videoDrivers = [
        "amdgpu"
        "nvidia"
      ];
      libinput = { # mouse
        enable = true;
        mouse = {
          scrollMethod = "button";
          scrollButton = 3;
        };
      };
      layout = "us";
      xkbVariant = "";
    };
    asusd = {
      enable = true; 
      enableUserService = true; 
    };
    printing = {
      enable = true;
    };
  };

  hardware.nvidia = {
    modesetting.enable = true;
    # Enable the Nvidia settings menu,
	  # accessible via `nvidia-settings`.
    nvidiaSettings = true;
    open = false;
    prime = {
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:65:0:0";
      reverseSync.enable = true; 
      # sync = {
      #  enable = true;
      # };
      offload = {
        # enable =  true;
        enableOffloadCmd = true; # Provides `nvidia-offload` command.
      };
    };
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.opengl = with pkgs; {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = [
      vaapiVdpau
    ];
  };

  fonts = {
    packages = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
    enableDefaultPackages = true;
  };
}