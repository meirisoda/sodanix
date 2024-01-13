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
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
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