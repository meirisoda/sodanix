{ config, pkgs, stablepkgs, sodasddm, hostname, ... }:

{
  services = {
    ratbagd.enable = true;
    mullvad-vpn.enable = true; 
    desktopManager = {
      plasma6.enable = true;
    };
    greetd = {
      enable = true;
      restart = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --greeting welcome! --user-menu --remember-session";
          user = "greeter";
        };
      };
    };
    libinput = { 
        enable = true;
        mouse = {
          scrollMethod = "button";
          scrollButton = 3;
        };
      };
  };

# TODO programs
  programs = {
    xwayland.enable = true; 
    hyprland = 
      if hostname == "sodaROG" then {
        enable = false; # ENABLE HYPRLAND
      }
      else {

      };
  };

# TODO env vars
  environment.variables = {
    KWIN_DRM_USE_MODIFIERS = "0";
    # ENABLE_VKBASALT = "1";
    GLFW_IM_MODULE = "ibus"; # kitty only supports ibus afaik
    WLR_NO_HARDWARE_CURSORS = "1";
  }; 
  # // (if hostname == "sodaROG" then {
      # KWIN_DRM_DEVICES = "/dev/dri/by-path/pci-0000\\:01\\:00.0-card"; 
    # } else {});

# TODO hardware opengl
  hardware.graphics = with pkgs; {
    enable = true;
    enable32Bit = true;
    extraPackages = [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-mono
      nerd-fonts.fira-code
      # nerd-fonts.fira-code-symbols
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      fira-code
      fira-code-symbols
    ];
    enableDefaultPackages = true;
  };

  environment.plasma6.excludePackages = with pkgs; [
    libsForQt5.konsole
    kdePackages.konsole
    # libsForQt5.knotification
    # kdePackages.knotification
  ];
}