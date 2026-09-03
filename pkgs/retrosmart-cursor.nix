{
  lib,
  stdenv,
  fetchFromGitHub,
  bash,
  imagemagick,
  xcursorgen,
  coreutils,
  python3,
}:

let
  python = python3.withPackages (ps: [ ps.pyyaml ps.pillow ]);
in
stdenv.mkDerivation {
  pname = "retrosmart-cursor";
  version = "unstable-2026-08-24";

  src = fetchFromGitHub {
    owner = "useless-anvil";
    repo = "retrosmart-cursor";
    rev = "29bbe605b73869fadab235c071210ab5cb593503";
    hash = "sha256-xhYZv6l3pgQ2Z0RKKvCAshq3Gn7wr7hK7LMghXDqBII=";
  };

  nativeBuildInputs = [
    bash
    imagemagick
    xcursorgen
    coreutils
    python
  ];

  postPatch = ''
    patchShebangs build.sh scripts
  '';

  buildPhase = ''
    runHook preBuild
    ./build.sh all
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r build_themes/Linux/. $out/share/icons/
    runHook postInstall
  '';

  meta = {
    description = "Retrosmart Xcursor themes (fork of mdomlop/retrosmart-x11-cursors)";
    homepage = "https://github.com/useless-anvil/retrosmart-cursor";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
  };
}
