{ lib
, stdenv
, cmake
, extra-cmake-modules
, kwin-x11
, wrapQtAppsHook
, qttools
}:

stdenv.mkDerivation rec {
  pname = "pearos-liquidgel";
  version = "26.1";

  src = ./..;

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    wrapQtAppsHook
  ];

  buildInputs = [
    kwin-x11
    qttools
  ];

  meta = with lib; {
    description = "Fork of the KWin Blur effect for pearOS with additional features (including force blur) and bug fixes";
    license = licenses.gpl3;
    homepage = "https://github.com/pearOS-archlinux/liquid-gel";
  };
}
