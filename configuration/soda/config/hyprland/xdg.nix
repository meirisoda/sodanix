{ config, pkgs, ... }:
{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "org.kde.okular.desktop";
      "image/png" = "org.kde.gwenview.desktop";
      "text/plain" = "codium.desktop";
      "image/svg+xml" = "inkscape.desktop";
      "video/mp4" = "mpv.desktop";
      "video/mpeg" = "mpv.desktop";
    };
  };
}