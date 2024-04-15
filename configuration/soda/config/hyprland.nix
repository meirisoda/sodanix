{ config, pkgs, stablepkgs, username, hostname, ... }@args :
{
  home-manager.users.${username} = {
    xdg.configFile = {
      "plasma-org.kde.plasma.desktop-appletsrc" = { 
        text = import ./plasma/plasmaappletsrc.nix {};
      };
      "hypr/hyprpaper.conf" = {
        text = import ./hyprland/hyprpaper.nix {};
      };
      "waybar/config.jsonc" = {
        text = import ./hyprland/waybar.nix {inherit pkgs;};
      };
      "hypr/hyprlock.conf" = {
        text = import ./hyprland/hyprlock.nix { inherit hostname; };
      };
      "hypr/hypridle.conf" = {
        text = import ./hyprland/hypridle.nix { inherit pkgs; };
      };
      "waybar/style.css" = {
        source = ./hyprland/waybar/style.css;
      };
      "tofi/config" = {
        source = ./hyprland/tofi/config;
      };
      # "xplr/init.lua" = {
      #   source = ./hyprland/init.lua;
      # };
    };
    wayland.windowManager = {
      hyprland = {
        enable = true;
        xwayland.enable = true;
        plugins = [];
        settings = {
          monitor = [
            "eDP-1, 2560x1600@120, 0x0,1.25"
            "HDMI-A-1,2560x1440@120,2048x0,1"
          ];
          exec-once = [
            "${pkgs.dunst}/bin/dunst"
            "${pkgs.hypridle}/bin/hypridle"
            "${pkgs.hyprpaper}/bin/hyprpaper"
            "${pkgs.networkmanagerapplet}/bin/nm-applet --indicatior"
            "${pkgs.waybar}/bin/waybar"
            "${pkgs.blueman}/bin/blueman-applet"
            "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store"
            "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store"
            # "for i in {8..1}; do hyprctl dispatch workspace $i; done;"
          ];
          bind = [
            # "SUPER_CTRL, right, workspace, m+1"
            # "SUPER_CTRL, left, workspace, m-1"
            # "SUPER_CTRL, 1, exec, workspace, m+1"
            # "SUPER_CTRL, 2, exec, workspace, m-1"

            # "SUPER_CTRL_ALT, right, movetoworkspace, m+1"
            # "SUPER_CTRL_ALT, left, movetoworkspace, m-1"
            # "SUPER_CTRL_ALT, 1, movetoworkspace, m+1"
            # "SUPER_CTRL_ALT, 2, movetoworkspace, m-1"

            "SUPER_CTRL, up, exec, sh ${./hyprland/workspace2d.sh} up all"
            "SUPER_CTRL, down, exec, sh ${./hyprland/workspace2d.sh} down all"
            "SUPER_CTRL_ALT, right, exec, sh ${./hyprland/workspace2d.sh} move_right all"
            "SUPER_CTRL_ALT, left, exec, sh ${./hyprland/workspace2d.sh} move_left all"
            "SUPER_CTRL_ALT, up, exec, sh ${./hyprland/workspace2d.sh} move_up all"
            "SUPER_CTRL_ALT, down, exec, sh ${./hyprland/workspace2d.sh} move_down all"
            "SUPER_CTRL, 1, exec, sh ${./hyprland/workspace2d.sh} right all"
            "SUPER_CTRL_ALT, 1, exec, sh ${./hyprland/workspace2d.sh} move_right all"
            "SUPER_CTRL, 2, exec, sh ${./hyprland/workspace2d.sh} left all"
            "SUPER_CTRL_ALT, 2, exec, sh ${./hyprland/workspace2d.sh} move_left all"
            "SUPER_CTRL_SHIFT, 1, exec, sh ${./hyprland/workspace2d.sh} up all"
            "SUPER_CTRL_SHIFT_ALT, 1, exec, sh ${./hyprland/workspace2d.sh} move_up all"
            "SUPER_CTRL_SHIFT, 2, exec, sh ${./hyprland/workspace2d.sh} down all"
            "SUPER_CTRL_SHIFT_ALT, 2, exec, sh ${./hyprland/workspace2d.sh} move_down allppli"

            "ALT, Space, exec, ${pkgs.tofi}/bin/tofi-drun --drun-launch=true"
            "SUPER_SHIFT, S, exec, ${pkgs.grimblast}/bin/grimblast copy area"
            ", XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_SINK@ toggle"
            "SHIFT, XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            
            "CTRL_ALT, T, exec, kitty"
            "ALT, E, exec, nautilus"
            "ALT, F, exec, firefox"
            "ALT, O, exec, obsidian"
            "ALT, V, exec, codium"
            "ALT, M, exec, element-desktop"
            "ALT, J, exec, jellyfin"
            "ALT, T, exec, tidal-hifi"
            ", XF86Launch1, exec, rog-control-center"

            "ALT, W, killactive"
            "ALT, Tab, cyclenext"
            "SUPER, Tab, changegroupactive, f"
            "SUPER_SHIFT, Tab, changegroupactive, b"
            "ALT, Tab, bringactivetotop"
            "CTRL_ALT_SHIFT, right, pin"

            "SUPER_CTRL, P, fullscreen, 2"
            "SUPER, G, togglegroup"
            "SUPER_SHIFT, G, moveoutofgroup"
            "ALT, P, togglefloating"
            "SUPER, L, exec, pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock"
            "SUPER_SHIFT, L, exec, hyprctl dispatch exit"

            "SUPER, Space, exec, ${pkgs.toybox}/bin/killall -SIGUSR1 waybar"

          ];
          binds = {
            movefocus_cycles_fullscreen = false;
          };
          bindm = [
            "SUPER, mouse:272, movewindow"
            "SUPER, mouse:274, resizewindow"
          ];
          binde = [
            ", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 3%-"
            ", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 3%+"
            ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl -d $(${pkgs.brightnessctl}/bin/brightnessctl -l -c backlight -m | cut -f 1 -d\",\") s 5%-"
            ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl -d $(${pkgs.brightnessctl}/bin/brightnessctl -l -c backlight -m | cut -f 1 -d\",\") s 5%+"
          ];
          env = if hostname != "sodaROG" then [
            "LIBVA_DRIVER_NAME,nvidia"
            "XDG_SESSION_TYPE,wayland"
            "GBM_BACKEND,nvidia-drm"
            "__GLX_VENDOR_LIBRARY_NAME,nvidia"
            "WLR_NO_HARDWARE_CURSORS,1"
          ] else [];

          # workspace = [
          #   "1, monitor:eDP-1, default:true, persistent:true"
          #   "2, monitor:eDP-1, persistent:true"
          #   "3, monitor:eDP-1, persistent:true"
          #   "4, monitor:eDP-1, persistent:true"
          #   "5, monitor:HDMI-A-1, defaultName:1a, persistent:true, default:true"
          #   "6, monitor:HDMI-A-1, defaultName:2a, persistent:true"
          #   "7, monitor:HDMI-A-1, defaultName:3a, persistent:true"
          #   "8, monitor:HDMI-A-1, defaultName:4a, persistent:true"
          # ];

          # windowrule = [
          #   "workspace 1, firefox"
          #   "workspace 21, codium"
          #   "workspace 31, element"
          #   "workspace 11, obsidian"
          #   "workspace 81, tidal-hifi"
          # ];
          windowrulev2 = [
            "float, class:^(kitty)$"
            "float, class:^(pavucontrol)$"
            "float, class:^(org\.gnome\.Nautilus)$"
            "float, class:^(org\.kde\.Gwenview)$"
            "size 1080 720, class:^(org\.gnome\.Nautilus)$"
          ];
          layerrule = [
            "blur, launcher"
          ];
          general = {
            border_size = 0;
            gaps_in = 2;
            gaps_out = 0;
            gaps_workspaces = 0;

            cursor_inactive_timeout = 10;
            layout = "dwindle";
            no_cursor_warps = false;
            no_focus_fallback = false;
            resize_on_border = true;
            extend_border_grab_area = 15;
            hover_icon_on_border = true;
            allow_tearing = false;
          };
          decoration = {
            rounding = 5;
            active_opacity = 1.0;
            inactive_opacity = 1.0;
            fullscreen_opacity = 1.0;
            drop_shadow = true;
            shadow_range = 5;
            shadow_render_power = 3;
            shadow_ignore_window = true;
            shadow_offset = "0 0";
            shadow_scale = 1.0;
            dim_inactive = true;
            dim_strength = 0.1;
            dim_special = 0.1;
            dim_around = 0.4;
            blur = {
              enabled = true;
              size = 8;
              passes = 3;
              ignore_opacity = false;
              xray = false;
              noise = 0.05;
              contrast = 0.9;
              brightness = 0.8;
              vibrancy = 0.1;
              vibrancy_darkness = 0.0;
              special = true;
              popups = true;
              popups_ignorealpha = 0.2;
            };
          };
          animations = {
            enabled = true;
            first_launch_animation = true;
          };
          animation = [
            "workspaces,1,1,default"
            "windows,1,1,default"
            "fade,0"
          ];
          input = {
            # kb_model = "pc104";
            kb_layout = "us";
            # kb_variant = "qwerty";
            kb_options = "compose:ralt";
            numlock_by_default = false;
            repeat_rate = 25;
            repeat_delay = 500;
            sensitivity = 1.0;
            accel_profile = "flat";
            force_no_accel = false;
            left_handed = false;
            # scroll_method = "2fg";
            scroll_method = "on_button_down";
            scroll_button = 273;
            scroll_button_lock = false;
            natural_scroll = false;
            follow_mouse = 2;
            mouse_refocus = true;
            float_switch_override_focus = 1;
            special_fallthrough = false;
            touchpad = {
              disable_while_typing = true;
              natural_scroll = true;
              scroll_factor = 1.0;
              middle_button_emulation = false;
              tap_button_map = "lrm";
              clickfinger_behavior = true;
              tap-to-click = true;
              drag_lock = true;
              tap-and-drag = false;
            };
            touchdevice = {
              transform = 0;
            };
            tablet = {
              transform = 0;
              region_position = "0 0";
              region_size = "0 0";
              relative_input = true;
            };
          };
          gestures = {
            workspace_swipe = true;
            workspace_swipe_fingers = 3;
            workspace_swipe_distance = 300;
            workspace_swipe_invert = true;
            workspace_swipe_min_speed_to_force = 30;
            workspace_swipe_cancel_ratio = 0.5;
            workspace_swipe_create_new = false;
            workspace_swipe_direction_lock = true;
            workspace_swipe_direction_lock_threshold = 20;
            workspace_swipe_forever = true;
            workspace_swipe_numbered = false;
          };
          group = {
            insert_after_current = true;
            focus_removed_window = true;
            groupbar = {
              enabled = true;
              font_family = "monospace"; 
              height = 14;
              "text_color" = "0xff000000";
              "col.active" = "0x20000000";
              "col.inactive" = "0x50000000";
            };
          };
          misc = {
            disable_hyprland_logo = true;
            focus_on_activate = true;
          };
        };
      };
    };

    programs.xplr = {
      enable = true;
    };
  };
}
