allconfig@{ attrs, config, pkgs, hostname, nixpkgs, stablepkgs,  ... }:

let
  username = "soda";
in
{
  imports =
  [
    ((import ./home-manager.nix) (allconfig // { inherit username; }))
    ((import ./soda/packages_config.nix)  (allconfig // { inherit username; }))
  ];

  users.defaultUserShell = pkgs.zsh;
  users.users.${username} = {
    hashedPassword = ''$y$j9T$wyokdDYUPZ5/uls7x2XtL1$tjSk0rJvgMAjVz8q2e4t1wT7t9BgWWuf1dPPg0nhjd4'';
    isNormalUser = true;
    description = "soda";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "adbusers" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      vscodium
    ];
  };

}
