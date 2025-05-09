{ config, pkgs, stablepkgs, username, hostname, attrs, ... }:

{
  home-manager.sharedModules = [ attrs.plasma-manager.homeManagerModules.plasma-manager ];
  home-manager.users.${username} = {
    home = {
      stateVersion = "24.11";
      packages = with pkgs; [
        libsForQt5.gwenview
      ];
      enableNixpkgsReleaseCheck = true;
    };
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };

    services = {
      dunst = {
        enable = false;
        settings = {
          global = {
            width = 300;
            height = 300;
            offset = "10x10";
            origin = "top-right";
            transparency = 10;
            font = "Arial 10";

            frame_width = "1";
            frame_color = "#464646";
            background = "#fff";
            foreground = "#464646";
            timeout = 10;
          };
        };
      };
    };

    programs = {
      git = {
        enable = true;
        userName = "meirisoda";
        userEmail = "meirisoda@proton.me";
        lfs = {
          enable = true;
        };
      };
      ssh = {
        enable = true; 
        matchBlocks = let 
          identityFile = "/home/${username}/.ssh/id_ed25519";
          user = "${username}";
          port = 22;
        in {
          "rog" = {
            hostname = "sodarog.student.cwru.edu";
            inherit user port identityFile;
          };
          "xps" = {
            hostname = "sodaxps.student.cwru.edu";
            inherit user port identityFile;
          };
          "nfs" = {
            hostname = "meirisoda_meirisoda@ssh.nyc1.nearlyfreespeech.net";
            user = "meirisoda_meirisoda"; 
            inherit port identityFile;
          };
        };
      };
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        autocd = true;
        oh-my-zsh = {
          enable = true;
        };
        plugins = [
          {
            file = "powerlevel10k.zsh-theme";
            name = "powerlevel10k";
            src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
          }
          {
            name = "powerlevel10k-config";
            file = "p10k.zsh";
            src = ./p10k;
          }
        ];
        shellAliases = {
          ca = "bat";
          clip = "xclip -selection clipboard -r";
          nvo = "nvidia-offload";
          jf = "jellyfinmediaplayer";
          ls = "lsd";
          la = "ls -al";
          out = "..";
          c = "codium .";
          sodanix = "cd /home/soda/Documents/nix/sodanix";
          cdnixos = "cd /etc/nixos";
          ga = "git add *";
          gac = "git commit -am";
          gp = "git push";
          gpl = "git pull";
          upd = "sudo bash -c \"cd ~/Documents/nix/sodanix; git pull; git add *\"";
          upg = "sudo bash -c \"cd ~/Documents/nix/sodanix; git stash; git stash clear; git pull; nixos-rebuild switch --flake \\\".#${hostname}\\\"\"";
          xps = "ssh soda@sodaxps.student.cwru.edu";
          rog = "ssh soda@sodarog.student.cwru.edu";
          sodasw = "sudo /run/current-system/specialisation/soda/bin/switch-to-configuration switch";
          mobilesw = "sudo /run/current-system/specialisation/mobile/bin/switch-to-configuration switch";
          watch = "watch -n 0.1 hyprctl activewindow";
          udm = "udiskie";
          t = "toot tui -f kitty";
        };
      };
      kitty = {
        enable = true;
        settings = {
          preview_images = true;
          background_opacity = "0.8";
          # background_blur = 5;
          foreground = "#ffffff";
          cursor = "#d6d6d6";
          selection_background = "#5b5b5b";
          selection_foreground = "#323232";
          color0 = "#353535";
          color8 = "#535353";
          color1 = "#d25252";
          color9 = "#f00c0c";
          color2 = "#a4c161";
          color10 = "#c1df74";
          color3 = "#ffc56d";
          color11 = "#e1e48a";
          color4 = "#6c99ba";
          color12 = "#8ab6d9";
          color5 = "#d096d9";
          color13 = "#efb5f7";
          color6 = "#bdd6ff";
          color14 = "#dbf4ff";
          color7 = "#ededec";
          color15 = "#ffffff";
          # active_tab_foreground = "#ffffff";
          # active_tab_background = "#535353";
          # inactive_tab_foreground = "#ffffff";
          # inactive_tab_background = "#353535";
        };
      };
      fzf = {
        enable = true;
        enableBashIntegration = true;
      };
    };
  };
}
