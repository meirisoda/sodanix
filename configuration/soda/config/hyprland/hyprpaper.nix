{ ... }:

let 
  wallpaper = ./wallpaper/cardcaptor.jpeg; 
  wallpaper2 = ./wallpaper/A.jpeg;
in
  '' 
  preload = ${wallpaper}
  preload = ${wallpaper2}
  wallpaper = eDP-1,${wallpaper}
  wallpaper = HDMI-A-1,${wallpaper2}
  ''