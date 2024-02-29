{ config, pkgs, stablepkgs, sodasddm, hostname, ... }:

{
  services = {
    ratbagd.enable = true;
    mullvad-vpn.enable = true; 
    xserver = {
      enable = true;
      desktopManager = {
        # plasma5.enable = true;
        plasma6.enable = true;
      };
      displayManager = {
        sddm = {
          enable = true;
          # theme = "${sodasddm}";
        };
      };
      libinput = { 
        enable = true;
        mouse = {
          scrollMethod = "button";
          scrollButton = 3;
        };
      };
      xkb = {
        layout = "us";
        variant = "";
      };
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
    ENABLE_VKBASALT = "1";
    GLFW_IM_MODULE = "ibus"; # kitty only supports ibus afaik
  } // (if hostname == "sodaROG" then {
      KWIN_DRM_DEVICES = "/dev/dri/by-path/pci-0000\\:01\\:00.0-card"; # Nvidia
    } else {});

# TODO hardware opengl
  hardware.opengl = with pkgs; {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  fonts = {
    packages = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      fira-code
      fira-code-symbols
    ];
    enableDefaultPackages = true;
  };
}