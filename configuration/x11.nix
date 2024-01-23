{ config, pkgs, stablepkgs, sodasddm, ... }:

{
  services = {
    ratbagd.enable = true; #mouse
    xserver = {
      enable = true;
      desktopManager = {
        plasma5.enable = true; 
      };
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
          theme = "${sodasddm}";
        };
      };
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
  };

  programs.xwayland.enable = true; 

  environment.variables = {
    KWIN_DRM_USE_MODIFIERS = "0";
    LIBSEAT_BACKEND = "logind"; 
    # RUST_BACKTRACE="1";
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