{ ... }:

let 
  wallpaper = ./wallpaper/bear.jpg; 
  wallpaper2 = ./wallpaper/bear.jpg;
in
  '' 
  preload = ${wallpaper}
  preload = ${wallpaper2}
  wallpaper = eDP-1,${wallpaper}
  wallpaper = HDMI-A-1,${wallpaper2}
  ''