# { pkgs, macos }:

# pkgs.stdenv.mkDerivation rec {
#   pname = "MacSequoia-kde";
#   version = "ef48bfe73712593df265b24e2f742826a2df35af";

#   src = macos;

#   installPhase = let 
#     SCHEMES_DIR = "$PREFIX/color-schemes";
#     PLASMA_DIR = "$PREFIX/plasma/desktoptheme";
#     LOOKFEEL_DIR = "$PREFIX/plasma/look-and-feel";
#     KVANTUM_DIR = "$PREFIX/Kvantum";
#     KONSOLE_DIR = "$PREFIX/konsole";
#     AURORAE_DIR="$PREFIX/aurorae/themes";
#     WALLPAPER_DIR="$PREFIX/share/wallpapers";
#     LATTE_DIR="$PREFIX/latte";
#     SRC_DIR = src;
#     DARK_THEME_DIR = "${PLASMA_DIR}/MacSequoia-dark/colors";
#     LIGHT_THEME_DIR = "${PLASMA_DIR}/MacSequoia-light/colors";
#   in
#   ''
#   #!/bin/bash

#   PREFIX="$out/share"
#   echo $out

#   mkdir -p ${SCHEMES_DIR}
#   mkdir -p ${DARK_THEME_DIR}
#   mkdir -p ${LIGHT_THEME_DIR}
#   mkdir -p ${LOOKFEEL_DIR}
#   mkdir -p ${KVANTUM_DIR}
#   mkdir -p ${KONSOLE_DIR}
#   mkdir -p ${WALLPAPER_DIR}
#   mkdir -p ${LATTE_DIR}
#   mkdir -p ${AURORAE_DIR}

#   cp -r color-schemes/*.colors                                            ${SCHEMES_DIR}
#   cp -r Kvantum/*                                                         ${KVANTUM_DIR}
#   cp -r konsole/*                                                         ${KONSOLE_DIR}
#   cp -r plasma/desktoptheme/*                                             ${PLASMA_DIR}
#   cp -r color-schemes/MacSequoiaLight.colors                              ${LIGHT_THEME_DIR}
#   cp -r color-schemes/MacSequoiaDark.colors                               ${DARK_THEME_DIR}
#   cp -r plasma/look-and-feel/*                                            ${LOOKFEEL_DIR}
#   cp -r wallpapers/*                                                      ${WALLPAPER_DIR}
#   cp -r latte-dock/*                                                      ${LATTE_DIR}

#   '';

#   meta = {
#     description = "MacSequoia kde is a MacOS Sequoia like theme for KDE Plasma desktop";
#     homepage = "https://github.com/vinceliuice/MacSequoia-kde";
#     license = pkgs.lib.licenses.gpl3;
#     platforms = pkgs.lib.platforms.all;
#   };
# }