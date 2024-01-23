{ config, pkgs, stablepkgs, sodasddm, ... }:

{
  services.xserver = {
    displayManager = {
      plasma5.enable = true;
      sddm = {
        enable = true;
        theme = "${sodasddm}";
      };
    };
  };
  
  programs.xwayland.enable = true;
}