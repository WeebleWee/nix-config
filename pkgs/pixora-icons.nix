{
  lib,
  stdenv,
  fetchFromGitHub,
  gtk3,
  hicolor-icon-theme,
}:

stdenv.mkDerivation {
  pname = "pixora-icons";
  version = "unstable-2026-07-28";

  src = fetchFromGitHub {
    owner = "tsora1603";
    repo = "pixora-icons";
    rev = "2992e376079dd41f0f05e4312ebbd80c9645407e";
    hash = "sha256-3XrGb2PhUarz4H0jYfBWIB5vOYXOKIlspSIm2+UCyk0=";
  };

  # gtk-update-icon-cache, run against the installed theme dirs below.
  nativeBuildInputs = [ gtk3 ];

  # Theme falls back to hicolor for icons it doesn't provide itself.
  propagatedBuildInputs = [ hicolor-icon-theme ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r pixora $out/share/icons/pixora
    cp -r pixora-dark $out/share/icons/pixora-dark
    gtk-update-icon-cache -f $out/share/icons/pixora
    gtk-update-icon-cache -f $out/share/icons/pixora-dark
    runHook postInstall
  '';

  meta = {
    description = "Pixora GTK icon theme";
    homepage = "https://github.com/tsora1603/pixora-icons";
    license = lib.licenses.cc-by-40;
    platforms = lib.platforms.all;
  };
}
