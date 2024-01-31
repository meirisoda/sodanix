{ config, pkgs, stablepkgs, sodasddm, ... }:

{
  services = {
    ratbagd.enable = true; #mouse
    mullvad-vpn.enable = true; # vpn 
    xserver = {
      enable = true;
      desktopManager = {
        plasma5.enable = true; 
      };
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
          # theme = "${sodasddm}";
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
# TODO programs
  programs = {
    xwayland.enable = true; 
    hyprland.enable = true;
  };
# TODO env vars
  environment.variables = {
    KWIN_DRM_USE_MODIFIERS = "0";
    GLFW_IM_MODULE = "ibus"; # kitty only supports ibus afaik
    LIBSEAT_BACKEND = "logind"; 
    # RUST_BACKTRACE="1";
  };
# TODO hardware opengl
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