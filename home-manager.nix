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
            name = "powerlevel10k";
            file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            src = pkgs.zsh-powerlevel10k;
          }
          {
            name = "powerlevel10k-config";
            file = "p10k.zsh";
            src = ./configs;
          }
        ];
        shellAliases = {
          ga = "git add *";
          gac = "git commit -am";
          gp = "git push";
          gpl = "git pull";
          rssound = "systemctl --user restart pipewire";
        };
      };
      kitty = {
        enable = true;
        settings = {
          background_opacity = "0.8";
        };
      };
      fzf = {
        enable = true;
        enableBashIntegration = true;
      };
    };
  };
}