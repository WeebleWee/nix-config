{ pkgs, ... }:

{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "xwayland-satellite" ]; }
    { command = [ "noctalia" ]; }
    { sh = "sleep 4; ${pkgs.vesktop}/bin/vesktop"; }
    { sh = "sleep 4; ${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.wl-clipboard}/bin/wl-copy --primary"; }
  ];
}
