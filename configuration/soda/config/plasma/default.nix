{ config, lib, pkgs, username, ...}: 
{
  # imports = [
  #   plasma-manager.homeManagerModules.plasma-manager

  #   # # ./kwin.nix # Night light, titlebar, virtual desktops
  #   # (import ./panels.nix (allConfig // {inherit username;})) # Panels
  #   # (import ./theme.nix (allConfig // {inherit username;})) # Colorschemes, Cursors, Effects, Fonts, Icons, Sounds and Wallpapers.
  # ];

  home-manager.users.${username} = {
    programs.plasma = {
      enable = true;
      overrideConfig = false;

      powerdevil = {
        AC = {
          autoSuspend = {
            action = "sleep";
            idleTimeout = 1800; 
          };
          dimDisplay = {
            enable = true;
            idleTimeout = 900; 
          };
        };
        battery = {
          autoSuspend = {
            action = "sleep";
            idleTimeout = 1800; 
          };
          dimDisplay = {
            enable = true;
            idleTimeout = 900; 
          };
        };
      };
      
      windows = {
        allowWindowsToRememberPositions = true;
      };

      workspace = {
        clickItemTo = "select";
        cursor = {
          theme = "WhiteSur-Cursors";
          size = 30;
        };
        iconTheme = "WhiteSur-dark";
        lookAndFeel = "com.github.vinceliuice.MacSequoia-Dark";
        soundTheme = "ocean";
        theme = "MacSequoia-Dark";
        tooltipDelay = 500;
        wallpaper = ./wallpaper/seiji.jpg;
      };

      kscreenlocker = {
        appearance = {
          wallpaper = ./wallpaper/ware.png;
        };
      };

      panels = [
        # # Dock
        # {
        #   alignment = "center";
        #   floating = true;
        #   height = 70;
        #   hiding = "dodgewindows";
        #   lengthMode = "fit";
        #   location = "bottom";
        #   screen = "all";
        #   widgets = [
        #     {
        #       iconTasks = {
        #         appearance = {
        #           fill = false;
        #           highlightWindows = true;
        #           iconSpacing = "medium";
        #           indicateAudioStreams = true;
        #           rows = {
        #             multirowView = "never";
        #             maximum = null;
        #           };
        #           showTooltips = true;
        #         };
        #         behavior = {
        #           grouping = {
        #             clickAction = "showPresentWindowsEffect";
        #             method = "byProgramName";
        #           };
        #           middleClickAction = "newInstance";
        #           minimizeActiveTaskOnClick = true;
        #           newTasksAppearOn = "right";
        #           showTasks = {
        #             onlyInCurrentActivity = true;
        #             onlyInCurrentDesktop = true;
        #             onlyMinimized = false;
        #             onlyInCurrentScreen = false;
        #           };
        #           sortingMethod = "manually";
        #           unhideOnAttentionNeeded = true;
        #           wheel = {
        #             ignoreMinimizedTasks = true;
        #             switchBetweenTasks = true;
        #           };
        #         };
        #         launchers = [
        #           "applications:org.kde.dolphin.desktop"
        #           "preferred://browser"
        #         ];
        #       };
        #     }
        #     "org.kde.plasma.marginsseparator"
        #     {
        #       plasmusicToolbar = {
        #         musicControls = {
        #           showPlaybackControls = true;
        #           volumeStep = 1;
        #         };
        #         panelIcon = {
        #           albumCover = {
        #             useAsIcon = true;
        #             radius = 8;
        #           };
        #           icon = "view-media-track";
        #         };
        #         # preferredSource = "any";
        #         songText = {
        #           displayInSeparateLines = true;
        #           maximumWidth = 200;
        #           scrolling = {
        #             behavior = "alwaysScrollExceptOnHover";
        #             enable = true;
        #             resetOnPause = true;
        #             speed = 3;
        #           };
        #         };
        #       };
        #     }
        #   ];
        # }
        # Top panel
        {
          alignment = "right";
          floating = false;
          height = 22;
          hiding = "autohide";
          lengthMode = "fill";
          location = "top";
          screen = "all";
          widgets = [
            {
              kickoff = {
                applicationsDisplayMode = "list";
                compactDisplayStyle = false;
                favoritesDisplayMode = "grid";
                label = null;
                pin = false;
                showActionButtonCaptions = true;
                showButtonsFor = "power";
                sidebarPosition = "right";
                sortAlphabetically = true;
              };
            }
            # {
            #   name = "org.kpple.kppleMenu";
            #   config.Appearance.compactView = false;
            # }
            {
              name = "org.kde.plasma.panelspacer";
              config.General = {
                expanding = true;
                lenght = -1;
              };
            }
            {
              name = "org.kde.plasma.pager";
            }
            {
              name = "org.kde.plasma.marginsseparator";
            }
            {
              name = "plasma_applet_dev.jhyub.supergfxctl";
            }
            {
              systemTray = {
                icons = {
                  scaleToFit = true;
                  spacing = "medium";
                };
                pin = false;
                items = {
                  shown = [
                    "org.kde.plasma.battery"
                  ];
                  hidden = [
                    "dev.jhyub.supergfxctl"
                    "org.kde.plasma.bluetooth"
                    "org.kde.plasma.clipboard"
                    "org.kde.plasma.notifications"
                  ];
                };
              };
            }
            {
              digitalClock = {
                calendar = {
                  firstDayOfWeek = "sunday";
                  plugins = [
                    "holidaysevents"
                  ];
                };
                date = {
                  enable = false;
                  # format = "shortDate";
                  # position = "adaptiveLocation";
                };
                font = {
                  bold = false;
                  family = "monospace";
                  italic = false;
                  size = 12;
                  weight = 400;
                };
                time = {
                  format = "12h";
                  showSeconds = "always";
                };
                timeZone = {
                  alwaysShow = false;
                  changeOnScroll = false;
                  lastSelected = "America/New_York";
                  selected = [
                    "America/New_York"
                    "UTC"
                  ];
                };
              };
            }
          ];
        }
      ];
    };
  };
}