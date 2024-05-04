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
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --greeting welcome! --remember --cmd Hyprland";
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
    # displayManager = {
    #   lightdm = {
    #     defaultSession = "Hyprland";
    #     enable = true;
    #   };
    #   # sddm = {
    #   #   enable = true;
    #   #   # theme = "${sodasddm}";
    #   # };
    # };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };  
  };

# TODO programs
  programs = {
    xwayland.enable = true; 
    hyprland = {
      enable = true;
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

  environment.plasma6.excludePackages = with pkgs; [
    libsForQt5.konsole
    kdePackages.konsole
    # libsForQt5.knotification
    # kdePackages.knotification
  ];
}