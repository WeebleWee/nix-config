{ pkgs, lib, ... }:

{
  programs.umbriel.settings.general.autostart = [
    "xwayland-satellite"
    "noctalia"
    "sleep 4; ${lib.getExe pkgs.vesktop}"
    "sleep 4; sh -c '${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.wl-clipboard}/bin/wl-copy --primary'"
  ];
}
