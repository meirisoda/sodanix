{config, pkgs, stablepkgs, ... }:

{
  services.udev.packages = [ pkgs.yubikey-personalization ];

  security.pam.u2f.enable = true;

  security.pam.yubico = {
    enable = true;
    ddm.u2fAuth = true;
    sddm-greeter.u2fAuth = true;
    login.u2fAuth = true;
    sudo.u2fAuth = true;
    kde.u2fAuth = true;
    xscreensaver.u2fAuth = true;
    debug = true;
    mode = "challenge-response";
    id = [ "20194367" ];
  };
}