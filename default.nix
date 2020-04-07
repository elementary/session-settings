{ pkgs ? import <nixpkgs> { config = {}; overlays = []; }
}:

with pkgs;

stdenv.mkDerivation rec {
  name = "elementary-session-settings";

  src = stdenv.lib.cleanSource ./.;

  nativeBuildInputs = [
    desktop-file-utils
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    pantheon.elementary-settings-daemon
    gnome3.gnome-keyring
    onboard
    orca
  ];

  mesonFlags = [
    "-Dmimeapps-list=false"
    "-Dfallback-session=GNOME"
    "-Ddetect-program-prefixes=true"
    "--sysconfdir=${placeholder "out"}/etc"
  ];

  meta = with stdenv.lib; {
    description = "Session settings for elementary";
    homepage = https://github.com/elementary/session-settings;
    license = licenses.lgpl3;
    platforms = platforms.linux;
    maintainers = pantheon.maintainers;
  };
}
