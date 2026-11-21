{ lib, stdenvNoCC, fetchFromGitHub, python3 }:

let
  variants = [ "pixelitos-dark" ];
  folderColor = "catppuccin-mocha-mauve";
in
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "pixelitos-icons";
  version = "0-unstable-2026-11-14";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "ItsZariep";
    repo = "pixelitos-icon-theme";
    rev = "b31fefc71e52defdfdab3b9fb996fc6d6d6300f7";
    hash = "sha256-BVwAXM05ilCN+hPd78hMSjYJERum2OeXPf6sT9V6ZHY=";
  };

  nativeBuildInputs = [ (python3.withPackages (ps: [ ps.pillow ])) ];

  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    runHook preInstall

    cat > convert.py <<'PY'
    import os
    import sys
    from PIL import Image

    CONTEXTS = {
        "actions": "Actions",
        "animations": "Animations",
        "apps": "Applications",
        "categories": "Categories",
        "devices": "Devices",
        "emblems": "Emblems",
        "mimetypes": "MimeTypes",
        "places": "Places",
        "status": "Status",
        "panel": "Applications",
    }


    def png_to_svg(src, dst):
        # lossless: every pixel becomes part of a rectangle, no tracing,
        # so the pixel art stays perfectly sharp at any size
        im = Image.open(src).convert("RGBA")
        w, h = im.size
        px = im.load()
        paths = {}
        for y in range(h):
            x = 0
            while x < w:
                colour = px[x, y]
                if colour[3] == 0:
                    x += 1
                    continue
                start = x
                while x < w and px[x, y] == colour:
                    x += 1
                run = x - start
                paths.setdefault(colour, []).append(f"M{start} {y}h{run}v1h-{run}z")
        out = [
            '<svg xmlns="http://www.w3.org/2000/svg" '
            f'width="{w}" height="{h}" viewBox="0 0 {w} {h}" '
            'shape-rendering="crispEdges">'
        ]
        for (r, g, b, a), segs in paths.items():
            d = "".join(segs)
            fill = f"#{r:02x}{g:02x}{b:02x}"
            opacity = "" if a == 255 else f' fill-opacity="{a / 255:.3f}"'
            out.append(f'<path fill="{fill}"{opacity} d="{d}"/>')
        out.append("</svg>")
        with open(dst, "w") as f:
            f.write("\n".join(out) + "\n")


    def convert_tree(theme):
        count = 0
        for dirpath, _, names in os.walk(theme):
            for name in names:
                if not name.lower().endswith(".png"):
                    continue
                src = os.path.join(dirpath, name)
                dst = src[:-4] + ".svg"
                if os.path.lexists(dst):
                    os.remove(dst)
                if os.path.islink(src):
                    target = os.readlink(src)
                    if target.lower().endswith(".png"):
                        target = target[:-4] + ".svg"
                    os.symlink(target, dst)
                else:
                    png_to_svg(src, dst)
                    count += 1
                os.remove(src)
        return count


    def rewrite_index(theme):
        # the old index.theme lists fixed-size PNG directories,
        # declare the SVG ones as scalable instead
        idx = os.path.join(theme, "index.theme")
        header = []
        in_main = False
        with open(idx) as f:
            for line in f:
                s = line.strip()
                if s.startswith("["):
                    if s == "[Icon Theme]":
                        in_main = True
                        continue
                    break
                if in_main and not s.startswith(("Directories=", "ScaledDirectories=")):
                    header.append(line.rstrip("\n"))
        dirs = []
        for dirpath, _, names in os.walk(theme):
            if any(n.endswith(".svg") for n in names):
                dirs.append(os.path.relpath(dirpath, theme))
        dirs.sort()
        lines = ["[Icon Theme]"] + header + ["Directories=" + ",".join(dirs), ""]
        for d in dirs:
            parts = d.split(os.sep)
            size = next((int(p) for p in parts if p.isdigit()), 16)
            ctx = next((CONTEXTS[p] for p in parts if p in CONTEXTS), None)
            lines += [f"[{d}]", f"Size={size}", "MinSize=8", "MaxSize=1024", "Type=Scalable"]
            if ctx:
                lines.append(f"Context={ctx}")
            lines.append("")
        with open(idx, "w") as f:
            f.write("\n".join(lines))


    root = sys.argv[1]
    for theme in sorted(os.listdir(root)):
        path = os.path.join(root, theme)
        if os.path.isdir(path) and os.path.exists(os.path.join(path, "index.theme")):
            n = convert_tree(path)
            rewrite_index(path)
            print(f"{theme}: converted {n} PNGs to SVG")
    PY

    mkdir -p $out/share/icons

    for theme in ${lib.escapeShellArgs variants}; do
      if [ ! -d "$theme" ]; then
        echo "theme directory $theme not found in source:"
        ls
        exit 1
      fi
      dest="$out/share/icons/$theme"
      cp -rP --no-preserve=mode "$theme" "$dest"

      # same as folder-colors.sh: overlay the chosen colour onto 16/places
      colour="$dest/folder-colors/${folderColor}/16/places"
      if [ ! -d "$colour" ]; then
        echo "folder colour not found, available:"
        ls "$dest/folder-colors"
        exit 1
      fi
      mkdir -p "$dest/16/places"
      cp -rfP "$colour"/. "$dest/16/places/"

      # not needed at runtime
      rm -rf "$dest/folder-colors" "$dest"/*.sh
    done

    python3 convert.py "$out/share/icons"

    runHook postInstall
  '';

  meta = {
    description = "16-bit pixel art style icons theme for Linux";
    homepage = "https://github.com/ItsZariep/pixelitos-icon-theme";
    license = lib.licenses.cc-by-40;
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.all;
  };
})
