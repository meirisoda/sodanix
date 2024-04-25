{ ... }:

let 
  wallpaper = ./wallpaper/mellow2.png; 
  wallpaper2 = ./wallpaper/mellow1.png;
in
  '' 
  preload = ${wallpaper}
  preload = ${wallpaper2}
  wallpaper = eDP-1,${wallpaper}
  wallpaper = HDMI-A-1,${wallpaper2}
  ''