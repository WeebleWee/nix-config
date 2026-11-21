{ lib, stdenvNoCC, fetchFromGitHub, python3 }:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "pixora-icons";
  version = "0-unstable-2026-11-03";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "tsora1603";
    repo = "pixora-icons";
    rev = "ea994cfa6dc9da1a468405d6bcb6aeffa80aa52e";
    hash = "sha256-S0/lgDth1+wIM5nj0NYRwu0H5DpV2+vyPuQZNJW3AEo=";
  };

  nativeBuildInputs = [ python3 ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    script=$(grep -rl --include='*.py' 'Build the optional Pixora Accent theme' . | head -n1 || true)
    [ -n "$script" ] || { echo "accent build script not found"; exit 1; }
    python3 "$script"

    mkdir -p $out/share/icons
    for d in */; do
      if [ -f "$d/index.theme" ]; then
        cp -rP --no-preserve=mode "$d" $out/share/icons/
      fi
    done

    [ -d $out/share/icons/pixora-accent ] || { echo "pixora-accent missing"; ls $out/share/icons; exit 1; }
    find $out/share/icons/pixora-accent -type f -name '*.svg' -exec \
      sed -i 's/\.ColorScheme-Accent { color:#e3c896; }/.ColorScheme-Accent { color:#9d6fff; }/' {} +

    idx="$out/share/icons/pixora-dark/index.theme"
    [ -f "$idx" ] || { echo "pixora-dark not found, installed themes:"; ls $out/share/icons; exit 1; }
    if grep -q '^Inherits=' "$idx"; then
      sed -i 's/^Inherits=.*/Inherits=pixelitos-dark/' "$idx"
    else
      sed -i '0,/^\[Icon Theme\]/s//&\nInherits=pixelitos-dark/' "$idx"
    fi

    idx="$out/share/icons/pixora-accent/index.theme"
    [ -f "$idx" ] || { echo "pixora-accent not found, installed themes:"; ls $out/share/icons; exit 1; }
    if grep -q '^Inherits=' "$idx"; then
      sed -i 's/^Inherits=.*/Inherits=pixelitos-dark/' "$idx"
    else
      sed -i '0,/^\[Icon Theme\]/s//&\nInherits=pixelitos-dark/' "$idx"
    fi

    runHook postInstall
  '';

  meta = {
    description = "16-bit pixel art style icons theme for Linux";
    homepage = "https://github.com/tsora1603/pixora-icons";
    license = lib.licenses.cc-by-40;
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.all;
  };
})
