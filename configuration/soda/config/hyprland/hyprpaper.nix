{ ... }:

let 
  wallpaper = ./wallpaper/seiji.jpg; 
  wallpaper2 = ./wallpaper/seiji.jpg;
in
  '' 
  preload = ${wallpaper}
  preload = ${wallpaper2}
  wallpaper = eDP-1,${wallpaper}
  wallpaper = HDMI-A-1,${wallpaper2}
  ''