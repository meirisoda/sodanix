{config, pkgs, stablepkgs, ... }:

{
  services.udev.packages = [ pkgs.yubikey-personalization ];

  security.pam.u2f.enable = true;

  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
    sddm.u2fAuth = true;
    sddm-greeter.u2fAuth = true;
    kde.u2fAuth = true;
    xscreensaver.u2fAuth = true;
  };
}