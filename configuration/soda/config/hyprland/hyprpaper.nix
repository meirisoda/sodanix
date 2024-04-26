{ ... }:

let 
  wallpaper = ./wallpaper/grey.png; 
  wallpaper2 = ./wallpaper/grey2.png;
in
  '' 
  preload = ${wallpaper}
  preload = ${wallpaper2}
  wallpaper = eDP-1,${wallpaper}
  wallpaper = HDMI-A-1,${wallpaper2}
  ''