with import <nixpkgs> { };
let qt5Version = qt5.qtbase.version;
in stdenv.mkDerivation rec {
  pname = "kime";
  version = "2.1.3";
  src = fetchFromGitHub {
    owner = "Riey";
    repo = "kime";
    rev = "660ba9cb494f93c34043da29bc84efb34c70440a";
    sha256 = "1zcg24vny4r7qg5zfilzp4cwrfbvyha0y02q37989f068kpkvzx3";
  };
  buildInputs =
    [ glib pango atk gdk-pixbuf gtk3 libappindicator-gtk3 qt5.qtbase ];
  nativeBuildInputs = with rustPlatform; [
    cargoSetupHook
    rust.cargo
    rust.rustc
    cmake
    pkgconfig
    ninja
    qt5.wrapQtAppsHook
    clang
  ];

  dontUseCmakeConfigure = true;

  cargoDeps = rustPlatform.fetchCargoTarball {
    inherit src;
    name = "${pname}-${version}";
    sha256 = "195g840m61l6diasxpwpickwg833h1pn7cx0dgf3zky5f7spg2kf";
  };

  LIBCLANG_PATH = "${llvmPackages.libclang}/lib";
  buildPhase = ''
    bash ./scripts/build.sh -ar
  '';

  installPhase = ''
    outDir=./build/out

    mkdir -p $out/bin
    mkdir -p $out/lib
    mkdir -p $out/lib/gtk-3.0/3.0.0/immodules
    mkdir -p $out/lib/qt-${qt5Version}/plugins/platforminputcontexts

    mkdir -p $out/include
    mkdir -p $out/etc/xdg/kime
    mkdir -p $out/share/kime/icons

    cp $outDir/kime-xim             $out/bin
    cp $outDir/kime-wayland         $out/bin

    cp $outDir/libkime_engine.so    $out/lib
    cp $outDir/libkime-gtk3.so      $out/lib/gtk-3.0/3.0.0/immodules/im-kime.so
    cp $outDir/libkime-qt5.so       $out/lib/qt-${qt5Version}/plugins/platforminputcontexts/libkimeplatforminputcontextplugin.so

    cp $outDir/kime_engine.h        $out/include
    cp $outDir/kime_engine.hpp      $out/include
    cp $outDir/default_config.yaml  $out/etc/xdg/kime/config.yaml
    cp -r $outDir/icons/*           $out/share/kime/icons
  '';

  meta = {
    description = "Korean IME";
    homepage = "https://github.com/Riey/kime";
    license = lib.licenses.gpl3;
    platforms = [ "x86_64-linux" ];
  };
}
