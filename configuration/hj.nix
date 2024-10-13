allconfig@{ attrs, config, pkgs, hostname, nixpkgs, stablepkgs,  ... }:

let
  username = "hj";
in
{
  imports =
  [
    ((import ./home-manager.nix) (allconfig // { inherit username; }))
    ((import ./soda/default.nix)  (allconfig // { inherit username; }))
  ];

  users.defaultUserShell = pkgs.zsh;
  users.users.${username} = {
    hashedPassword = ''$y$j9T$yYV6C6CqIwPdTHRVU0UKz.$YeP3Y3tmGqA0F7IllV.x9jc2dOp6rsAPoQrmDK/8xUD'';
    isNormalUser = true;
    description = "temp for hyunjung";
    extraGroups = [ "networkmanager" "libvirtd"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      vscodium
      libreoffice
      gimp
      inkscape
      krita
      zoom-us
      spotify
      google-chrome
    ];
  };

}
