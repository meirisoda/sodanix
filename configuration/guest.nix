allconfig@{ attrs, config, pkgs, hostname, nixpkgs, stablepkgs,  ... }:

let
  username = "guest";
in
{
  imports =
  [
    ((import ./home-manager.nix) (allconfig // { inherit username; }))
    ((import ./soda/default.nix)  (allconfig // { inherit username; }))
  ];

  users.defaultUserShell = pkgs.zsh;
  users.users.${username} = {
    hashedPassword = ''$y$j9T$8sqzTIX1c8nrtBaDUec1h0$qIWDEcpoNIH7B8BmhAYFihIvHA0hL2cMFE3r9i6PTaB'';
    isNormalUser = true;
    description = "guest";
    extraGroups = [ "networkmanager" "libvirtd"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      google-chrome
      libreoffice
      gimp
      inkscape
      krita
      zoom-us
      spotify
    ];
  };

}
