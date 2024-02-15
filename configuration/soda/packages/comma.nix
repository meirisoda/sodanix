{ pkgs, config, username, attrs, ...}:

{
  programs.command-not-found.enable = pkgs.lib.mkForce false;

  home-manager.users.${username} = {
      home = {
        packages = with pkgs; [
            attrs.nix-index-database.comma-with-db
        ];
      };
      programs = {
        nix-index = {
          enable = true;
          package = attrs.nix-index-database.nix-index-with-db;
          enableBashIntegration = true;
          enableZshIntegration = true;
          enableFishIntegration = true;
        };

        command-not-found.enable = false;
      };
    };
}