{ ... }:

let 
  wallpaper = ./wallpaper/grey.jpg; 
  wallpaper2 = ./wallpaper/grey2.jpg;
in
  '' 
  preload = ${wallpaper}
  preload = ${wallpaper2}
  wallpaper = eDP-1,${wallpaper}
  wallpaper = HDMI-A-1,${wallpaper2}
  ''