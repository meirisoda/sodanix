{ config, nixpkgs, ...}:

{
  i18n.inputMethod = {
    enabled = "kime";
    kime = {
      daemonModules = [
        "Wayland"
        "Indicator"
      ];
      iconColor = "White";
    };
  }; 
}