{ config, pkgs, stablepkgs, ... }:

{
  home-manager.users."soda" = {
    home = {
      stateVersion = "24.05";
    };
    programs = {
      git = {
        enable = true;
        userName = "meirisoda";
        userEmail = "appleblossom2001@gmail.com";
        lfs = {
          enable = true;
        };
      };
      zsh = {
        enable = true;
        enableAutosuggestions = true;
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
          sodanix = "cd /home/soda/Documents/sodanix";
          ga = "git add *";
          gac = "git commit -am";
          gp = "git push";
          gpl = "git pull";
          nvo = "nvidia-offload";
          rssound = "systemctl --user restart pipewire";
          flakeupg = "nix flake upgrade";
        };
      };
      kitty = {
        enable = true;
        settings = {
          background_opacity = "0.75";
          background_blur = 5;
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
          active_tab_foreground = "#ffffff";
          active_tab_background = "#535353";
          inactive_tab_foreground = "#ffffff";
          inactive_tab_background = "#353535";
        };
      };
      fzf = {
        enable = true;
        enableBashIntegration = true;
      };
    };
  };
}