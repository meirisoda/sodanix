{ config, pkgs, stablepkgs, ... }:

{
  imports =
    [
      ./x11/plasma.nix
    ];
  services = {
    xserver = {
      enable = true;
      libinput.enable = true;
      layout = "us";
      xkbVariant = "";
      videoDrivers = [
        "nvidia"
      ];
    };
    printing = {
      enable = true;
    };
  };

  hardware.nvidia = {
    modesetting.enable = true;
    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false; 
    # Enable the Nvidia settings menu,
	  # accessible via `nvidia-settings`.
    nvidiaSettings = true;
    prime = {
      offload = {
        enable =  true;
        nvidiaBusId = "PCI:01:00.0";
        amdgpuBusId = "PCI:65:00.0";
        enableOffloadCmd = true; # Provides `nvidia-offload` command.
      };
    };
    package = config.boot.kernelPackages.nvidiaPackages.production;
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