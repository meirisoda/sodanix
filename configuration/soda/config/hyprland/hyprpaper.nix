{ ... }:

let 
  wallpaper = ./wallpaper/july2024.jpg; 
  wallpaper2 = ./wallpaper/july2024.jpg;
in
  '' 
  preload = ${wallpaper}
  preload = ${wallpaper2}
  wallpaper = eDP-1,${wallpaper}
  wallpaper = HDMI-A-1,${wallpaper2}
  ''